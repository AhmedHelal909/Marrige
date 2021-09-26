<?php

namespace App\Http\Controllers\Api\site;

use App\CustomClass\response;
use App\Http\Resources\ChatResource;
use App\Http\Resources\employee_candat_status;
use App\Http\Resources\employeeResource;
use App\Http\Resources\jobAvMeetings;
use App\Http\Resources\jobMeetingsResource;
use App\Http\Resources\jobResource;
use App\Http\Resources\employeeChatResource;
use App\Http\Resources\notificationResource;
use App\Models\Avmeeting;
use App\Models\Chat;
use App\Models\EmployeeJob;
use App\Models\EmployeeNotifications;
use App\Models\Employees;
use App\Models\EmployerChat;
use App\Models\job;
use App\Models\Report;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;
use Illuminate\Validation\Rule;


class employer
{
    //job meeting
    public function newjob(Request $request){
        //validation
        $validator = Validator::make($request->all(), [
            'field'           => 'required|exists:categories,id|integer',
            'title'                 =>'required | string | min:2 | max:60',
            'details'               =>'required | string | min:2 | max:1000',
            'note'                  =>'required | string | min:2 | max:1000',
            'salary'                =>'required | numeric',
            'gender'                =>['required',Rule::in(0,1,2)],
            'applies'               =>'required | integer',
            'experience'            =>'required | integer',
            'qualification'         =>'required | string | min:2 | max:80',
            'interviewer_name'      =>'required | string | min:2 | max:60',
            'interviewer_role'      =>'required | string | min:2 | max:60',
            'meeting_date'          =>'required | date',
            'meeting_from'          =>'required',
            'meeting_to'            =>'required',
            'meeting_time'          =>'required | numeric',
        ]);

        if($request->get('meeting_to') < $request->get('meeting_from')){
            return response::falid('The start time should be after the end time', 400);
        }
        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        //get user by token
        try {
            if (! $employer = auth('employer')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }
        

        //create job(meeting)
        $job = job::create([
            'employer_id'    => $employer->id,
            'category_id'    => $request->get('field'),
            'title' => $request->get('title'),
            'details'=>$request->get('details'),
            'note'=>$request->get('note'),
            'salary'=>$request->get('salary'),
            'gender'=>$request->get('gender'),
            'experience'=>$request->get('experience'),
            'qualification'=>$request->get('qualification'),
            'interviewer_name'=>$request->get('interviewer_name'),
            'interviewer_role'=>$request->get('interviewer_role'),
            'meeting_date'=>$request->get('meeting_date'),
            'meeting_from'=>$request->get('meeting_from'),
            'meeting_to' => $request->get('meeting_to'),
            'meeting_time'=>$request->get('meeting_time'),
            'applies' => $request->get('applies'),
            'status' => 1,
        ]);

        //addd meeting time to our tables
        $for =strtotime($job->meeting_from);
        $to   =strtotime($job->meeting_to);
        $dif=floor(($to - $for)/60)/$job->meeting_time;
        $startTime = date("H:i", strtotime($job->meeting_from));
        for($i=0; $i<$dif; $i++)
        {
           $endTime = date("H:i", strtotime('+'. $job->meeting_time .' minutes', strtotime($startTime)));
           Avmeeting::create([
                'job_id'    =>$job->id,
                'time_from' =>$startTime,
                'time_to'   =>$endTime,
                'available' =>0,
           ]);
           $startTime=$endTime;
        }
        //end add meeting table to our time


        return response::suceess('add new job success', 200, 'new job', new jobResource($job));

    }

    public function jobEdit(Request $request){
        //validation
        $validator = Validator::make($request->all(), [
            'job_id'                => 'required|exists:jobs,id|integer',

            'title'                 =>'nullable | string | min:2 | max:60',
            'field'                 =>'nullable|exists:categories,id|integer',
            'details'               =>'nullable | string | min:2 | max:1000',
            'salary'                =>'nullable | numeric',
            'gender'                =>['nullable',Rule::in(0,1,2)],
            'experience'            =>'nullable | integer',
            'qualification'         =>'nullable | string | min:2 | max:80',
            'meeting_date'          =>'nullable | date',
            'meeting_from'          =>'required_with:meeting_to,meeting_time',
            'meeting_to'            =>'required_with:meeting_from,meeting_time',
            'meeting_time'          =>'required_with:meeting_from,meeting_to | numeric',
            'interviewer_name'      =>'nullable | string | min:2 | max:60',
            'interviewer_role'      =>'nullable | string | min:2 | max:60',
            'applies'               =>'nullable | integer',
            'note'                  =>'nullable | string | min:2 | max:1000',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        //get user by token
        try {
            if (! $employer = auth('employer')->user()) {
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
        $job = job::where('employer_id', '=', $employer->id)->where('status', '=', 1)->find($request->get('job_id'));    
        if($job == null){
            return response::falid('this job not found', 404);
        }
        
        //update job
        if($request->has('title')){
            $job->title         = $request->get('title');
        }
        if($request->has('field')){
            $job->category_id         = $request->get('field');
        }

        if($request->has('details')){
            $job->details       = $request->get('details');
        }
        if($request->has('salary')){
            $job->salary        = $request->get('salary');
        }
        if($request->has('gender')){
            $job->gender        = $request->get('gender');
        }
        if($request->has('experience')){
            $job->experience    = $request->get('experience');
        }
        if($request->has('qualification')){
            $job->qualification = $request->get('qualification');
        }
        if($request->has('interviewer_name')){
            $job->interviewer_name = $request->get('interviewer_name');
        }

        if($request->has('interviewer_role')){
            $job->interviewer_role = $request->get('interviewer_role');
        }
        if($request->has('applies')){
            $job->applies          = $request->get('applies');
        }

        if($request->has('note')){
            $job->note             = $request->get('note');
        }

        //check if meeting time , date, meeting form, meeting to if not changed 
        if(($request->get('meeting_date') != $job->meeting_date) || ($request->get('meeting_from') != $job->meeting_from) || ($request->get('meeting_to') != $job->meeting_to) || ($request->get('meeting_time') != $job->meeting_time)){
            $count=$job->avmeetings->where('available',1)->count();

            if($count != 0){
                return response::falid('you can\'t edit job time', 400);
            }

            //update time (meeting)
            if($request->has('meeting_date')){
                $job->meeting_date  = $request->get('meeting_date');
            }
            if($request->has('meeting_from')){
                $job->meeting_from  = $request->get('meeting_from');
            }
            if($request->has('meeting_to')){
                $job->meeting_to    = $request->get('meeting_to');
            }
            if($request->has('meeting_time')){
                $job->meeting_time  = $request->get('meeting_time');
            }

            if($count > 0)
            {
                $request_data=$request->except(['meeting_date','meeting_from','meeting_to','meeting_time']);   
                $job->update($request_data);
            }else{
                $job->avmeetings()->delete();
                $for =strtotime($request->get('meeting_from'));
                $to   =strtotime($request->get('meeting_to'));
                $dif=floor(($to - $for)/60)/$request->get('meeting_time');
                $startTime = date("H:i", strtotime($request->get('meeting_from')));
                for($i=0; $i<$dif; $i++)
                {
                $endTime = date("H:i", strtotime('+'. $request->get('meeting_time') .' minutes', strtotime($startTime)));
                Avmeeting::create([
                        'job_id'    =>$job->id,
                        'time_from' =>$startTime,
                        'time_to'   =>$endTime,
                        'available' =>0,
                ]);
                $startTime=$endTime;
                }
            }
        }

        if($job->save()){
            return response::suceess('update job success', 200, 'job', new jobResource($job));
        } else {
            return response::falid('edit job faild', 400);
        }

        return 'asd';

    }

    public function JobCanceled(Request $request){
        //validation
        $validator = Validator::make($request->all(), [
            'job_id'           => 'required|exists:jobs,id|integer',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        //get user by token
        try {
            if (! $employer = auth('employer')->user()) {
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
        $job = job::where('employer_id', '=', $employer->id)->find($request->get('job_id'));  
        
        //there are no job with this id
        if($job == null){
            return response::falid('this job not found', 404);
        }

        //if some employee has meeting
        $count=$job->avmeetings->where('available',1)->count();
        if($count != 0){
            return response::falid('you can\'t delete this job now Because employee has a meeting', 400);
        }

        //cancelle meeting
        $candats = EmployeeJob::where('job_id', '=', $job->id)->get();
        
        foreach($candats as $candat){
            $candat->candat_status = 0;
            $candat->save();
        }

        // Cancelle (delete) job
        $job->status = 0;
        if($job->save()){
            return response::suceess('delete success', 200);
        }
    }
    //before meeting
    public function myCandat(Request $request){
        //validation
        $validator = Validator::make($request->all(), [
            'candat_status'           => ['required',Rule::in(0,1,2,3)],  // 0->reject 1->accept 2->underreview employer who detemine this, 3->all, ,
            'job_id'                  => 'required|exists:jobs,id|integer',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        try {
            if (! $employer = auth('employer')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }

        if($request->get('candat_status') == 0){
            //all
            $jobMeetings = EmployeeJob::where('job_id', '=', $request->get('job_id'))->whereHas('job', function($q) use($employer){
                $q->whereHas('employer', function($q) use($employer){
                    $q->where('employer_id', '=', $employer->id);
                })->where('status', '=', 1);
            })->get();

        } else if($request->get('candat_status') == 1){
            //need to confirm
            $jobMeetings = EmployeeJob::where('job_id', '=', $request->get('job_id'))->where('candat_applay_status', '=', null)->whereHas('job', function($q) use($employer){
                $q->whereHas('employer', function($q) use($employer){
                    $q->where('employer_id', '=', $employer->id);
                })->where('status', '=', 1);
            })->get();

        } else if($request->get('candat_status') == 2){
            $jobMeetings = EmployeeJob::where('job_id', '=', $request->get('job_id'))->where('candat_applay_status', '=', 1)->whereHas('job', function($q) use($employer){
                $q->whereHas('employer', function($q) use($employer){
                    $q->where('employer_id', '=', $employer->id);
                })->where('status', '=', 1);
            })->get();
        } else {
            $jobMeetings = EmployeeJob::where('job_id', '=', $request->get('job_id'))->where('candat_applay_status', '=', 0)->whereHas('job', function($q) use($employer){
                $q->whereHas('employer', function($q) use($employer){
                    $q->where('employer_id', '=', $employer->id);
                })->where('status', '=', 1);
            })->get();
        }

        return response::suceess('success', 200, 'candat', jobMeetingsResource::collection($jobMeetings));
    }

    public function acceptRejectCandat(Request $request){
        if($request->get('status') == 0){
            $validator = Validator::make($request->all(), [
                'candat_id'    => 'required|exists:employee_job,id|integer',
                'status'         => ['required',Rule::in(0,1)],      //0->reject  1->accept
            ]);
        } else {
            //validation
            $validator = Validator::make($request->all(), [
                'avmeeting_id'    => 'required|exists:avmeetings,id|integer',
                'candat_id'    => 'required|exists:employee_job,id|integer',
                'status'         => ['required',Rule::in(0,1)],      //0->reject  1->accept
            ]);
        }   

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        //get employer
        try {
            if (! $employer = auth('employer')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }

        //select employee_job
        $employee_job = EmployeeJob::where('candat_applay_status', '=', null)->whereHas('job', function($q) use($employer){
            $q->where('employer_id', '=', $employer->id);
        })->get()->find($request->get('candat_id'));


        //notification
        $employee_job = EmployeeJob::where('candat_applay_status', '=', null)->whereHas('job', function($q) use($employer){
            $q->where('employer_id', '=', $employer->id);
        })->get()->find($request->get('candat_id'));

        
        //accept or reject
        if($employee_job == null){
            //candat already accepted or reject or this job not for this employer
            return response::falid('some thing is wrong', 400);
        }

        //upade EmployeeJob
        if($request->get('status') == 1){
            //check meeting time (employer enter)
            $Avmeeting = Avmeeting::where('job_id', '=', $employee_job->job_id)->where('available', '=', 0)->find($request->get('avmeeting_id'));   
            
            if($Avmeeting == null){
                return response::falid('you enter wrong available meeting', 400);
            } else {
                //accept
                //check meeting (not tooken)
                $Avmeeting->available = 1;
                $Avmeeting->save();

                //accept candate
                $employee_job->candat_applay_status = 1;
                $employee_job->avmeeting_id = $Avmeeting->id;
                $employee_job->save();
            }
        } else{
            //reject
            //accept candate
            $employee_job->candat_applay_status = 0;
            $employee_job->save();
        }


        // EmployeeNotifications::create([
        //     'type' => 1,
        //     'employee_id'=> $employee_job->employee_id,
        //     'title' => 'title',
        //     'body' => 'body',
        //     'candate_id' => $employee_job->id,
        // ]);


        // $employeeToken = Employees::find($employee_job->employee_id)->token;

        //send notification

        // $SERVER_API_KEY = 'AAAAqttdwVs:APA91bHEPj_vMkdmCAZcYvL6TQkBYTYEqGAu4dBUZ4jqnKrhSwUstUBRAs6KJrGr9hGj231ikEPs1TX88dKkkt218VwAgnIR_859e7qkpV141-wgxScB6SQZvmHIzwpNvU3wRgYYC74h';

        // $token_1 = $employeeToken;

        // $data = [

        //     "registration_ids" => [
        //         $token_1
        //     ],

        //     "notification" => [

        //         "title" => 'Welcome',

        //         "body" => 'Description',

        //         "sound"=> "default" // required for sound on ios

        //     ],

        // ];

        // $dataString = json_encode($data);

        // $headers = [

        //     'Authorization: key=' . $SERVER_API_KEY,

        //     'Content-Type: application/json',

        // ];

        // $ch = curl_init();

        // curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');

        // curl_setopt($ch, CURLOPT_POST, true);

        // curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

        // curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

        // curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        // curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);

        // $response = curl_exec($ch);


        return response::suceess('success', 200);
    }

    public function employeeProfile(Request $request){
        $validator = Validator::make($request->all(), [
            'employee_id'          => 'required|exists:employees,id|integer',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        return response::suceess('success', 200, 'employeeDetails', new employeeResource(Employees::find($request->get('employee_id'))));

    }

    public function meetingLive(){
        //get user by token
        try {
            if (! $employer = auth('employer')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }

        $jobs = job::where('employer_id', '=', $employer->id)->where('meeting_date', '=', date('y-m-d'))->get();
        return response::suceess('success', 200, 'jobs', jobResource::collection($jobs));
    }

    public function acceptedEmployee(Request $request){
        //validation
        $validator = Validator::make($request->all(), [
            'job_id'           => 'required|exists:jobs,id|integer',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        try {
            if (! $employer = auth('employer')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }

        $employees = Employees::whereHas('EmployeeJob', function($q) use($request, $employer){
            $q->where('job_id', '=', $request->job_id)->where('meeting_time_status', '=', 1)->whereHas('job', function($query) use($employer){
                $query->where('employer_id', '=', $employer->id);
            });
        })->get();
        return response::suceess('success', 200, 'accepted_employees', employeeResource::collection($employees));
    }

    public function report(Request $request){
        $validator = Validator::make($request->all(), [
            'employee_id'    => 'required|exists:employees,id|integer',
            'note'           => 'required|min:3',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        try {
            if (! $employeer = auth('employer')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {
            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);

        } catch (JWTException $e) {

            return response::falid('token_absent', 400);

        }

        //check if employer not make report for this employee
        $report = Report::where('employee_id', '=', $request->get('employee_id'))->where('employer_id', '=', $employeer->id)->get();

        if($report->first() != null){
            return response::falid('you already make report for this employee', 400);
        }

        //block 
        if($report->count() >= 10){
            $employee = Employees::find($request->get('employee_id'));
            $employee->block = 1;
            $employee->save();
        }

        //make reoprt for this employee
        Report::create([
            'employee_id' => $request->get('employee_id'),
            'employer_id' => $employeer->id,
            'note'        => $request->get('note'),
        ]);

        return response::suceess('make report success', 200);
    }

    public function review(Request $request){
        //get user by token
        try {
            if (! $employer = auth('employer')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }

        //validation
        $validator = Validator::make($request->all(), [
            'candat_id'    => 'required|exists:employee_job,id|integer',
            'review'         => 'required'
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        $EmployeeJob = EmployeeJob::find($request->get('candat_id'));
        $job = Job::where('status', '=', 1)->find($EmployeeJob->job_id);

        if($job->employer_id != $employer->id){
            return response::falid('this job not for you', 400);
        }

        //add or edit note in EmployeeJob
        $EmployeeJob->note = $request->get('review');
        if($EmployeeJob->save()){
            return response::suceess('success', 200, 'note', $request->get('review'));
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
            if (! $employer = auth('employer')->user()) {
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
        $job = job::where('employer_id', '=', $employer->id)->where('status', '=', 1)->find($request->get('job_id'));     
        if($job == null){
            return response::falid('this job not found', 404);
        }

        return response::suceess('success', 200, 'job', new jobAvMeetings($job));
    }

    public function mainPage(){
        try {
            if (! $employer = auth('employer')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }

        $myJobs = Job::where('employer_id', '=', $employer->id)->where('status', '=', 1)->get();
        $authorJobs = Job::where('employer_id', '!=', $employer->id)->where('status', '=', 1)->where('category_id', '=', $employer->business)->get();
        
        return response()->json([
            'status'  => true,
            'message' => 'success',
            'myJob' => jobResource::collection($myJobs),
            'authorJobs'=> jobResource::collection($authorJobs),
            // 'authorJobs'=> jobResource::collection($authorJobs)->response()->getData(true),

        ], 200);
    }

    public function schedule(){
        //get employer
        try {
            if (! $employer = auth('employer')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }

        $job = jobResource::collection(job::withCount('EmployeeJob')->where('status', '=', 1)->where('employer_id', '=', $employer->id)->get());

        return response::suceess('success', 200, 'schedule', $job);
    }

    public function meetingSummary(){
        //get employer
        try {
            if (! $employer = auth('employer')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }

        $job = jobResource::collection(job::withCount('EmployeeJob')->where('status', '=', 1)->where('employer_id', '=', $employer->id)->where('meeting_date', '<', date('y-m-d'))->get());

        return response::suceess('success', 200, 'schedule', $job);
    }

    //get  employee by candat status (after interview) after interview
    public function employees(Request $request){
        //validation
        $validator = Validator::make($request->all(), [
            'candat_status'           => ['required',Rule::in(0,1,2,3)],  // 0->reject 1->accept 2->underreview employer who detemine this, 3->all, ,
            'job_id'                  => 'required|exists:employee_job,id|integer'
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        try {
            if (! $employer = auth('employer')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }

        if($request->get('candat_status') == 3){
            //all
            $employees = Employees::whereHas('EmployeeJob', function($q) use($employer, $request){
                $q->where('candat_status', '!=', null)->whereHas('job', function($query) use($employer, $request){
                    $query->where('employer_id', '=', $employer->id)->where('id', '=', $request->get('job_id'));
                });
            })->get();
        } else {
            // accept & reject & under review
            $employees = Employees::whereHas('EmployeeJob', function($q) use($employer, $request){
                $q->where('candat_status', '=', $request->get('candat_status'))->whereHas('job', function($query) use($employer, $request){
                    $query->where('employer_id', '=', $employer->id)->where('id', '=', $request->get('job_id'));
                });
            })->get();
        } 

        return response::suceess('success', 200, 'employees', employee_candat_status::collection($employees));
    }

    //chat
    public function myScheduleChat(){
        //get user by token
        try {
            if (! $employer = auth('employer')->user()) {
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
        $employees = Employees::whereHas('employerChat', function($q) use($employer){
            $q->where('employer_id', '=', $employer->id);
        })->orWhereHas('employeeChat', function($q) use($employer){
            $q->where('employer_id', '=', $employer->id);
        })->get();

        return response::suceess('success', 200, 'employees', employeeChatResource::collection($employees));
    }

    public function makeChat(Request $request){
        //validation
        $validator = Validator::make($request->all(), [
            'employee_id'           => 'required|exists:employees,id|integer',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        //get user by token
        try {
            if (! $employer = auth('employer')->user()) {
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
        $employerChat = EmployerChat::where('employer_id', '=', $employer->id)->where('employee_id', '=', $request->get('employee_id'))->first();
        
        if($employerChat == null){
            //if this employer don't chat with this employee
            EmployerChat::create([
                'employer_id' => $employer->id,
                'employee_id' => $request->get('employee_id'),
            ]);
        } else {
            //if this employer already caht with this employer
            $employerChat->delete();
            EmployerChat::create([
                'employer_id' => $employer->id,
                'employee_id' => $request->get('employee_id'),
            ]);
        }

        return response::suceess('success', 200);
    }

    public function makeVideo(Request $request){
        $validator = Validator::make($request->all(), [
            'employee_id'           => 'required|exists:employees,id|integer',
            'viedo_channel_name'    => 'required|string',
            'viedo_token'           => 'required|string',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        $notification = EmployeeNotifications::create([
            'type'               => 2,
            'title'              => 'title',
            'body'               => 'body',
            'employee_id'        => $request->get('employee_id'),
            'viedo_channel_name' => $request->get('viedo_channel_name'),
            'viedo_token'        => $request->get('viedo_channel_name'),
        ]);

        $notification = EmployeeNotifications::find($notification->id);

        //make notification

        $employeeToken = Employees::find($request->get('employee_id'))->token;


        $SERVER_API_KEY = 'AAAAqttdwVs:APA91bHEPj_vMkdmCAZcYvL6TQkBYTYEqGAu4dBUZ4jqnKrhSwUstUBRAs6KJrGr9hGj231ikEPs1TX88dKkkt218VwAgnIR_859e7qkpV141-wgxScB6SQZvmHIzwpNvU3wRgYYC74h';

        $token_1 = $employeeToken;

        $data = [

            "registration_ids" => [
                $token_1
            ],

            "notification" => [

                "notification" =>  $notification,

                "sound"=> "default" // required for sound on ios

            ],

        ];

        $dataString = json_encode($data);

        $headers = [

            'Authorization: key=' . $SERVER_API_KEY,

            'Content-Type: application/json',

        ];

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');

        curl_setopt($ch, CURLOPT_POST, true);

        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);

        $response = curl_exec($ch);

        return response::suceess('success', 200);
    }

    public function makeChatNotification(Request $request){
        $validator = Validator::make($request->all(), [
            'employee_id'           => 'required|exists:employees,id|integer',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        $employeeToken = Employees::find($request->get('employee_id'))->token;


        $SERVER_API_KEY = 'AAAAqttdwVs:APA91bHEPj_vMkdmCAZcYvL6TQkBYTYEqGAu4dBUZ4jqnKrhSwUstUBRAs6KJrGr9hGj231ikEPs1TX88dKkkt218VwAgnIR_859e7qkpV141-wgxScB6SQZvmHIzwpNvU3wRgYYC74h';

        $token_1 = $employeeToken;

        $data = [

            "registration_ids" => [
                $token_1
            ],
    
            "notification" => [
    
                "title" => 'title',
    
                "body" => 'body',
    
                "sound"=> "default" // required for sound on ios
    
            ],
    
        ];

        $dataString = json_encode($data);

        $headers = [

            'Authorization: key=' . $SERVER_API_KEY,

            'Content-Type: application/json',

        ];

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');

        curl_setopt($ch, CURLOPT_POST, true);

        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);

        $response = curl_exec($ch);

        return response::suceess('success', 200);
    }

}
