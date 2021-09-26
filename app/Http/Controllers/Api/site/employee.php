<?php

namespace App\Http\Controllers\Api\site;

use App\CustomClass\response;
use App\Http\Controllers\Controller;
use App\Http\Resources\avmeetingResource;
use App\Http\Resources\ChatResource;
use App\Http\Resources\employeeResource;
use App\Http\Resources\employerResource;
use App\Http\Resources\jobMeetingsResource;
use App\Http\Resources\jobResource;
use App\Http\Resources\employerChatResource;
use App\Http\Resources\notificationResource;
use App\Models\Avmeeting;
use App\Models\Chat;
use App\Models\EmployeeJob;
use App\Models\Employer;
use App\Models\EmployeeChat;
use App\Models\EmployeeNotifications;
use App\Models\job;
use Illuminate\Http\Request;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Jobs;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;

class employee extends Controller
{
    public function jobDetails(Request $request){
        $validator = Validator::make($request->all(), [
            'job_id'    => 'required|exists:jobs,id|integer',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }
        $job = job::where('status', '=', 1)->where('id', '=', $request->get('job_id'))->first();
        
        if($job == null){
            return response::falid('this job not found', 404);
        }

        return response::suceess('success', 200, 'jobDetails', new jobResource($job));
    }

    public function myCandat(){
        try {
            if (! $employee = auth('employee')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }
        
        $jobMeetings = EmployeeJob::whereHas('employee', function($q) use($employee){
            $q->where('employee_id', '=', $employee->id);
        })->where('candat_applay_status', '=', 1)->get();

        return response::suceess('success', 200, 'candats' , jobMeetingsResource::collection($jobMeetings));
    }

    public function mainPage(){
        try {
            if (! $employee = auth('employee')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }
        
        return response::suceess('success', 200, 'jobs', jobResource::collection(Job::where('category_id', '=', $employee->category_id)->where('status', '=', 1)->get()));

    }

    public function companyDetails(Request $request){
        $validator = Validator::make($request->all(), [
            'employer_id'    => 'required|exists:employers,id|integer',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        return response::suceess('success', 200, 'employer', new employerResource(Employer::find($request->get('employer_id'))));
    }

    public function applyforJob(Request $request){
        //get employee
        try {
            if (! $employee = auth('employee')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }
        // validation
        $validator = Validator::make($request->all(), [
            'job_id'    => 'required|exists:jobs,id|integer',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }


        $job = Job::where('status', '=', 1)->find($request->get('job_id'));

        if($job == null){
            return response::falid('job closed', 200);
        } else {
            //check if employee already apply for this job
            $EmployeeJob = EmployeeJob::where('job_id', '=', $request->get('job_id'))->where('employee_id', '=', $employee->id)->first();
            
            if($EmployeeJob == null){
                EmployeeJob::create([
                    'job_id' => $request->get('job_id'),
                    'employee_id' => $employee->id,
                ]);
                return response::suceess('apply for job success', 200);
            } else {
                return response::falid('you already apply for this job', 200);
            }
        }
    }

    public function acceptOffer(Request $request){
        // validation
        $validator = Validator::make($request->all(), [
            'candat_id'    => 'required|exists:employee_job,id|integer',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        //get employee
        try {
            if (! $employee = auth('employee')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }


        $EmployeeJob = EmployeeJob::where('employee_id', '=', $employee->id)->find($request->get('candat_id'));

        if($EmployeeJob == null){
            return response::falid('this employee not found', 404);
        } else {
            //accept
            $EmployeeJob->meeting_time_status = 1;
            $EmployeeJob->save();
            return response::suceess('accept candat success', 200);
        }

    }

    public function accept_offer_with_author_meeting(Request $request){
        //get employee
        try {
            if (! $employee = auth('employee')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }

        // validation
        $validator = Validator::make($request->all(), [
            'candat_id'    => 'required|exists:employee_job,id|integer',
            'meetings_time'   => 'required|exists:avmeetings,id|integer',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        $EmployeeJob = EmployeeJob::where('employee_id', '=', $employee->id)->find($request->get('candat_id'));

        if($EmployeeJob == null){
            return response::falid('this employee not found', 404);
        } else {
            //get meeting time (and check if it is available)
            $avmeetings = Avmeeting::where('available', '=', 0)->where('job_id', '=', $EmployeeJob->job_id)->find($request->get('meetings_time'));

            if($avmeetings == null){
                return response::falid('this meeting time nout available', 404);
            } else {
                //make first avmeeting => available
                $first_avmeeting = Avmeeting::find($EmployeeJob->avmeeting_id);
                $first_avmeeting->available = 0;
                $first_avmeeting->save();
        
                //update for new avmeeting and accept
                $EmployeeJob->avmeeting_id = $request->get('meetings_time');
                $EmployeeJob->meeting_time_status = 1;
                $EmployeeJob->save();

                $avmeetings->available = 1;
                $avmeetings->save();

                return response::suceess('accept candat success', 200);
            }

        }
    }

    public function availableMeetings(Request $request){
        $validator = Validator::make($request->all(), [
            'job_id'         => 'required|exists:jobs,id|integer',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        try {
            if (! $employee = auth('employee')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {
            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);

        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }

        //check if job for this employer
        $avmeeting = avmeetingResource::collection(Avmeeting::where('available', '=', 0)->where('job_id', '=', $request->get('job_id'))->get());

        return response::suceess('success', 200, 'available_Meetings', $avmeeting);
    }

    public function myJobs(Request $request){
        $validator = Validator::make($request->all(), [
            'status'    => ['required',Rule::in(0,1,2,3)],
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        // sellect employee
        try {
            if (! $employee = auth('employee')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }

        if($request->get('status') == 3){
            $jobs =  EmployeeJob::where('employee_id', '=', $employee->id)->get();
        } else {
            $jobs =  EmployeeJob::where('employee_id', '=', $employee->id)->where('candat_status', '=', $request->get('status'))->get();
        }
        

        return response::suceess('success', 200, 'jobs', jobMeetingsResource::collection($jobs));
    }

    public function mySchedule(){
        // sellect employee
        try {
            if (! $employee = auth('employee')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }
        $notConfirmed = EmployeeJob::where('employee_id', '=', $employee->id)->where('candat_applay_status', '=', 1)->where('meeting_time_status', '=', null)->get();
        $confirmed = EmployeeJob::where('employee_id', '=', $employee->id)->where('meeting_time_status', '=', 1)->get();

        return response()->json([
            'status'  => true,
            'message' => 'success',
            'not_confirmed'=> jobMeetingsResource::collection($notConfirmed),
            'confirmed'=> jobMeetingsResource::collection($confirmed),
        ], 200);
    }

    public function jobCategory(Request $request){
        $validator = Validator::make($request->all(), [
            'category_id'    => 'required|exists:categories,id|integer',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        $jobs = Job::where('category_id', '=', $request->get('category_id'))->where('status', '=', 1)->get();

        return response::suceess('success', 200, 'jobs', jobResource::collection($jobs));

    }

    //chat
    public function myScheduleChat(){
        //get user by token
        try {
            if (! $employee = auth('employee')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }
        //get employees that the employer chat with thim
        $employers = Employer::whereHas('employeeChat', function($q) use($employee){
            $q->where('employee_id', '=', $employee->id);
        })->orWhereHas('employerChat', function($q) use($employee){
            $q->where('employee_id', '=', $employee->id);
        })->get();

        return response::suceess('success', 200, 'employers', employerChatResource::collection($employers));
    }

    public function makeChat(Request $request){
        //validation
        $validator = Validator::make($request->all(), [
            'employer_id'           => 'required|exists:employers,id|integer',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        //get user by token
        try {
            if (! $employee = auth('employee')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }

        //check if i already make chat
        $employerChat = EmployeeChat::where('employee_id', '=', $employee->id)->where('employer_id', '=', $request->get('employer_id'))->first();
        
        if($employerChat == null){
            //if this employee don't chat with this employer
            EmployeeChat::create([
                'employer_id' => $request->get('employer_id'),
                'employee_id' => $employee->id,
            ]);
        } else {
            //if this employee already caht with this employee
            $employerChat->delete();
            EmployeeChat::create([
                'employer_id' => $request->get('employer_id'),
                'employee_id' => $employee->id,
            ]);
        }

        return response::suceess('success', 200);
    }

    public function getEmplyeeNotification(){
        try {
            if (! $employee = auth('employee')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }
        
        $notifications = EmployeeNotifications::where('employee_id', '=', $employee->id)->orderBy('id', 'desc')->get();
        return response::suceess('success', 200, 'notifications', notificationResource::collection($notifications));

    }
}
