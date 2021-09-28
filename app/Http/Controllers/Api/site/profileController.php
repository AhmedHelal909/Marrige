<?php

namespace App\Http\Controllers\Api\site;

use App\CustomClass\response;
use App\Http\Resources\employeeResource;
use App\Http\Resources\employerResource;
use App\Http\Resources\HusbandResource;
use App\Http\Resources\WifeResource;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;
use App\Models\Employees;
use App\Models\Employer;
use App\Models\Husband;
use App\Models\Wife;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use JWTAuth;
use Auth;
use Illuminate\Support\Facades\DB;

class profileController
{
    public function getProfile(Request $request){
        $guard = $request->route()->getName();
        try {
            if (! $user = auth($guard)->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 400);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 400);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 400);
        }

        if($guard == 'husband'){
            return response::suceess('success', 200, 'husband', new HusbandResource($user));
        } else {
            return response::suceess('success', 200, 'wife', new WifeResource($user));
        }
    }

    public function updateEmployeeProfile(Request $request){

        // return $request;
        try {
            if (! $employee = auth('employee')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 401);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 401);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 401);
        }

        // validate registeration request
        $validator = Validator::make($request->all(), [
            'fullName'          => 'nullable|string|max:250',
            'email'             => 'nullable|email|max:255|unique:employees,email,'. $employee->id,
            'password'          => 'nullable|string|min:6',
            'confirmPassword'   => 'required_with:password|string|same:password',
            'country'           => 'nullable|string|max:250',
            'city'              => 'nullable|string|max:250',
            'title'             => 'nullable|string|max:250',
            'qualification'     => 'nullable|string|max:250',
            'university'        => 'nullable|string|max:250',
            'graduation_year'   => 'nullable|integer|max:5000',
            'experience'        => 'nullable|integer',
            'study_field'       => 'nullable|string|max:250',
            'deriving_licence'  => ['nullable',Rule::in(0,1)],      //0->no 1->yes
            'birth'             => 'nullable|string',
            'gender'            => ['nullable',Rule::in(0,1,2)],    //0->male  1->female 2->other
            'skills'            => 'array|nullable',
            'skills.*'          => 'nullable|string',
            'industry'          => 'nullable|exists:categories,id|integer',
            'languages'         => 'array|nullable',
            'languages.*'       => 'nullable|string',
            'cv'                => 'nullable|mimes:doc,pdf,docx',
            'audio'             => 'nullable|file',
            'video'             => 'nullable|mimes:mp4,mov,ogg',
            'image'             => 'nullable|mimes:jpg,jpeg,png,svg',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }


        //selet employee
        $employee = Employees::find($employee->id)->makeVisible(['password' ,'title',
        'qualification','university','graduation_year','study_field','deriving_licence',
        'state','skills','languages','cv','audio','video','birth','gender', 'image']);

        //update data
        if($request->has('password')){
            if(Hash::check($request->oldPassword, $employee->password)){
                $employee->password  = Hash::make($request->get('password'));
                
            } else {
                return response::falid('old password is wrong', 400);
            }
        }

        if($request->has('fullName')){
            $employee->fullName      = $request->get('fullName');
        }
        if($request->has('email')){
            $employee->email         = $request->get('email');
        }

        if($request->has('country')){
            $employee->country       = $request->get('country');
        }

        if($request->has('city')){
            $employee->city          = $request->get('city');
        }

        if($request->has('industry')){
            $employee->category_id          = $request->get('industry');
        }

        if($request->has('title')){
            $employee->title          = $request->get('title');
        }

        if($request->has('qualification')){
            $employee->qualification          = $request->get('qualification');
        }

        if($request->has('university')){
            $employee->university          = $request->get('university');
        }

        if($request->has('graduation_year')){
            $employee->graduation_year          = $request->get('graduation_year');
        }

        if($request->has('experience')){
            $employee->experience          = $request->get('experience');
        }

        if($request->has('study_field')){
            $employee->study_field          = $request->get('study_field');
        }

        if($request->has('deriving_licence')){
            $employee->deriving_licence          = $request->get('deriving_licence');
        }

        if($request->has('birth')){
            $employee->birth          = $request->get('birth');
        }

        if($request->has('gender')){
            $employee->gender          = $request->get('gender');
        }

        if($request->has('languages')){
            $employee->languages          = $request->get('languages');
        }

        if($request->has('skills')){
            $employee->skills          = $request->get('skills');
        }

        //updat cv
        if($request->has('cv')){
            if($employee->cv == null){
                $path = rand(0,1000000) . time() . '.' . $request->file('cv')->getClientOriginalExtension();
                $request->file('cv')->move(base_path('public/uploads/employee/cv') , $path);
                $employee->cv   = $path;
            } else {
                $oldCv = $employee->cv;

                //updat cv
                $path = rand(0,1000000) . time() . '.' . $request->file('cv')->getClientOriginalExtension();
                $request->file('cv')->move(base_path('public/uploads/employee/cv') , $path);
                $employee->cv   = $path;

                //delet old cv
                if(file_exists(base_path('public/uploads/employee/cv/') . $oldCv)){
                    unlink(base_path('public/uploads/employee/cv/') . $oldCv);
                }   
            }
        }

        //updat audio
        if($request->has('audio')){
            if($employee->audio == null){
                $path = rand(0,1000000) . time() . '.' . $request->file('audio')->getClientOriginalExtension();
                $request->file('audio')->move(base_path('public/uploads/employee/audio') , $path);
                $employee->audio   = $path;
            } else {
                $oldAudio = $employee->audio;

                //updat audio
                $path = rand(0,1000000) . time() . '.' . $request->file('audio')->getClientOriginalExtension();
                $request->file('audio')->move(base_path('public/uploads/employee/audio') , $path);
                $employee->audio   = $path;

                //delet old audio
                if(file_exists(base_path('public/uploads/employee/audio/') . $oldAudio)){
                    unlink(base_path('public/uploads/employee/audio/') . $oldAudio);
                }   
            }
        }

        //updat video
        if($request->has('video')){
            if($employee->video == null){
                $path = rand(0,1000000) . time() . '.' . $request->file('video')->getClientOriginalExtension();
                $request->file('video')->move(base_path('public/uploads/employee/video') , $path);
                $employee->video   = $path;
            } else {
                $oldVideo = $employee->video;

                //updat video
                $path = rand(0,1000000) . time() . '.' . $request->file('video')->getClientOriginalExtension();
                $request->file('video')->move(base_path('public/uploads/employee/video') , $path);
                $employee->video   = $path;

                //delet old video
                if(file_exists(base_path('public/uploads/employee/video/') . $oldVideo)){
                    unlink(base_path('public/uploads/employee/video/') . $oldVideo);
                }
            }
        }

        //updat image
        if($request->has('image')){
            if($employee->image == null){
                $path = rand(0,1000000) . time() . '.' . $request->file('image')->getClientOriginalExtension();
                $request->file('image')->move(base_path('public/uploads/employee/image') , $path);
                $employee->image   = $path;
            } else {
                $oldImage = $employee->image;

                //updat image
                $path = rand(0,1000000) . time() . '.' . $request->file('image')->getClientOriginalExtension();
                $request->file('image')->move(base_path('public/uploads/employee/image') , $path);
                $employee->image   = $path;

                //delet old image
                if(file_exists(base_path('public/uploads/employee/image/') . $oldImage)){
                    unlink(base_path('public/uploads/employee/image/') . $oldImage);
                }   
            }
        }           

        if($employee->save()){
            return response::suceess('update profile success', 200, 'employee', new employeeResource($employee));
        } else {
            return response::falid('update profile falid', 400);
        }
    }

    public function updateEmployerProfile(Request $request){
        try {
            if (! $employer = auth('employer')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 401);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 401);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 401);
        }

        // validate registeration request
        $validator = Validator::make($request->all(), [
            'user'          => 'nullable|string|max:250',
            'title'             => 'nullable|string|max:250',
            'email'             => 'nullable|email|max:255|unique:employers,email,'. $employer->id,
            'password'          => 'nullable|string|min:6',
            'confirmPassword'   => 'required_with:password|string|same:password',
            'mobile_number1'    => 'nullable|string|min:8',
            'mobile_number2'    => 'nullable|string|min:8',
            'company_name'      => 'nullable|string|max:250',
            'country'           => 'nullable|string|max:250',
            'city'              => 'nullable|string|max:250',
            'business'          => 'nullable|exists:categories,id|integer',
            'established_at'    => 'nullable|string|max:250',
            'website'           => 'nullable|string|max:250',
            'image'             => 'nullable|file',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }


        //sellect employer
        $employer = Employer::find($employer->id)->makeVisible(['company_name',
        'country', 'city', 'business', 'established_at', 'website', 'image', 'mobile_number2']);

        //update data
        if($request->has('password')){
            if(Hash::check($request->oldPassword, $employer->password)){
                $employer->password  = Hash::make($request->get('password'));
                
            } else {
                return response::falid('old password is wrong', 405);
            }
        }

        if($request->has('fullName')){
            $employer->fullName      = $request->get('fullName');
        }
        if($request->has('email')){
            $employer->email         = $request->get('email');
        }

        if($request->has('mobile_number1')){
            $employer->mobile_number1       = $request->get('mobile_number1');
        }

        if($request->has('mobile_number')){
            $employer->mobile_number2       = $request->get('mobile_number2');
        }

        if($request->has('title')){
            $employer->city          = $request->get('title');
        }

        if($request->has('company_name')){
            $employer->company_name       = $request->get('company_name');
        }

        if($request->has('country')){
            $employer->country       = $request->get('country');
        }

        if($request->has('city')){
            $employer->city       = $request->get('city');
        }

        if($request->has('business')){
            $employer->business       = $request->get('business');
        }

        if($request->has('established_at')){
            $employer->established_at       = $request->get('established_at');
        }

        if($request->has('website')){
            $employer->website       = $request->get('website');
        }

        //updat image
        if($request->has('image')){
            if($employer->image == null){
                $path = rand(0,1000000) . time() . '.' . $request->file('image')->getClientOriginalExtension();
                $request->file('image')->move(base_path('public/uploads/employer/image') , $path);
                $employer->image   = $path;
            } else {
                $oldImage = $employer->image;

                //updat image
                $path = rand(0,1000000) . time() . '.' . $request->file('image')->getClientOriginalExtension();
                $request->file('image')->move(base_path('public/uploads/employer/image') , $path);
                $employer->image   = $path;

                //delet old image
                if(file_exists(base_path('public/uploads/employer/image/') . $oldImage)){
                    unlink(base_path('public/uploads/employer/image/') . $oldImage);
                }   
            }
        }


        if($employer->save()){
            return response::suceess('update profile success', 200, 'employer',  new employerResource($employer));
        } else {
            return response::falid('update profile falid', 400);
        }
    }
    public function updateWifeProfile(Request $request){
        try {
            if (! $employer = auth('wife')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 401);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 401);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 401);
        }

        // validate registeration request
        $validator = Validator::make($request->all(), [
            'user_name'          => 'nullable|string|max:250',
            'email'             => 'nullable|email|max:255|unique:employers,email,'. $employer->id,
            'password'          => 'nullable|string|min:6',
            'confirmPassword'   => 'required_with:password|string|same:password',
            'country_id'    => 'nullable|string|min:8',
            'marrige_type'    => 'nullable|string|min:8',
            'social_status'      => 'nullable|string|max:250',
            'age'           => 'nullable|string|max:250',
            'child_no'              => 'nullable|string|max:250',
            'weight'    => 'nullable|string|max:250',
            'height'    => 'nullable|string|max:250',
            'skin_color'    => 'nullable|string|max:250',
            'physique'    => 'nullable|string|max:250',
            'religiosity'           => 'nullable|string|max:250',
            'pray'           => 'nullable|string|max:250',
            'smoke'           => 'nullable|string|max:250',
            'hijab'           => 'nullable|string|max:250',
            'educational_equal'           => 'nullable|string|max:250',
            'financial_status'           => 'nullable|string|max:250',
            'health_status'           => 'nullable|string|max:250',
            'monthly_income'           => 'nullable|string|max:250',
            'partner_specification'           => 'nullable|string|max:250',
            'self_description'           => 'nullable|string|max:250',
            'fullname'           => 'nullable|string|max:250',
            'phone'           => 'nullable|string|max:250',
            'job'           => 'nullable|string|max:250',
            'work'           => 'nullable|string|max:250',
            'nationality'           => 'nullable|string|max:250',
            'token_firebase'           => 'nullable|string|max:250',
            'image'             => 'nullable|file',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }


        //sellect employer
        $employer = Wife::find($employer->id)->makeVisible(['company_name',
        'country', 'city', 'business', 'established_at', 'website', 'image', 'mobile_number2']);

        //update data
        if($request->has('password')){
            if(Hash::check($request->oldPassword, $employer->password)){
                $employer->password  = Hash::make($request->get('password'));
                
            } else {
                return response::falid('old password is wrong', 405);
            }
        }

        if($request->has('user_name')){
            $employer->user_name      = $request->get('fullName');
        }
        if($request->has('email')){
            $employer->email         = $request->get('email');
        }

        if($request->has('country_id')){
            $employer->country_id       = $request->get('country_id');
        }
        if($request->has('marrige_type')){
            $employer->marrige_type       = $request->get('marrige_type');
        }
        if($request->has('social_status')){
            $employer->social_status       = $request->get('social_status');
        }
        if($request->has('age')){
            $employer->age       = $request->get('age');
        }
        if($request->has('child_no')){
            $employer->child_no       = $request->get('child_no');
        }

        if($request->has('weight')){
            $employer->weight       = $request->get('weight');
        }

        if($request->has('height')){
            $employer->height          = $request->get('height');
        }

        if($request->has('skin_color')){
            $employer->skin_color       = $request->get('skin_color');
        }

        if($request->has('physique')){
            $employer->physique       = $request->get('physique');
        }

        if($request->has('religiosity')){
            $employer->religiosity       = $request->get('religiosity');
        }

        if($request->has('pray')){
            $employer->pray       = $request->get('pray');
        }

        if($request->has('smoke')){
            $employer->smoke       = $request->get('smoke');
        }

        if($request->has('hijab')){
            $employer->hijab       = $request->get('hijab');
        }
        if($request->has('educational_equal')){
            $employer->educational_equal       = $request->get('educational_equal');
        }
        if($request->has('financial_status')){
            $employer->financial_status       = $request->get('financial_status');
        }
        if($request->has('health_status')){
            $employer->health_status       = $request->get('health_status');
        }
        if($request->has('monthly_income')){
            $employer->monthly_income       = $request->get('monthly_income');
        }
        if($request->has('partner_specification')){
            $employer->partner_specification       = $request->get('partner_specification');
        }
        if($request->has('self_description')){
            $employer->self_description       = $request->get('self_description');
        }
        if($request->has('fullname')){
            $employer->fullname       = $request->get('fullname');
        }
        if($request->has('phone')){
            $employer->phone       = $request->get('phone');
        }
        if($request->has('job')){
            $employer->job       = $request->get('job');
        }
        if($request->has('work')){
            $employer->work       = $request->get('work');
        }
        if($request->has('nationality')){
            $employer->nationality       = $request->get('nationality');
        }
        if($request->has('token_firebase')){
            $employer->token_firebase       = $request->get('token_firebase');
        }

        //updat image
        if($request->has('image')){
            if($employer->image == null){
                $path = rand(0,1000000) . time() . '.' . $request->file('image')->getClientOriginalExtension();
                $request->file('image')->move(base_path('public/uploads/husbands') , $path);
                $employer->image   = $path;
            } else {
                $oldImage = $employer->image;

                //updat image
                $path = rand(0,1000000) . time() . '.' . $request->file('image')->getClientOriginalExtension();
                $request->file('image')->move(base_path('public/uploads/wives') , $path);
                $employer->image   = $path;

                //delet old image
                if(file_exists(base_path('public/uploads/wives/') . $oldImage)){
                    unlink(base_path('public/uploads/wives/') . $oldImage);
                }   
            }
        }


        if($employer->save()){
            return response::suceess('update profile success', 200, 'employer',  new WifeResource($employer));
        } else {
            return response::falid('update profile falid', 400);
        }
    }
    public function updateHusbandProfile(Request $request){
        try {
            if (! $employer = auth('husband')->user()) {
                return response::falid('user_not_found', 404);
            }

        } catch (TokenExpiredException $e) {

            return response::falid('token_expired', 401);

        } catch (TokenInvalidException $e) {

            return response::falid('token_invalid', 401);
            
        } catch (JWTException $e) {

            return response::falid('token_absent', 401);
        }

        // validate registeration request
        $validator = Validator::make($request->all(), [
            'user_name'          => 'nullable|string|max:250',
            'email'             => 'nullable|email|max:255|unique:employers,email,'. $employer->id,
            'password'          => 'nullable|string|min:6',
            'confirmPassword'   => 'required_with:password|string|same:password',
            'country_id'    => 'nullable|string|min:8',
            'marrige_type'    => 'nullable|string|min:8',
            'social_status'      => 'nullable|string|max:250',
            'age'           => 'nullable|string|max:250',
            'child_no'              => 'nullable|string|max:250',
            'weight'    => 'nullable|string|max:250',
            'height'    => 'nullable|string|max:250',
            'skin_color'    => 'nullable|string|max:250',
            'physique'    => 'nullable|string|max:250',
            'religiosity'           => 'nullable|string|max:250',
            'pray'           => 'nullable|string|max:250',
            'smoke'           => 'nullable|string|max:250',
            'beard'           => 'nullable|string|max:250',
            'educational_equal'           => 'nullable|string|max:250',
            'financial_status'           => 'nullable|string|max:250',
            'health_status'           => 'nullable|string|max:250',
            'monthly_income'           => 'nullable|string|max:250',
            'partner_specification'           => 'nullable|string|max:250',
            'self_description'           => 'nullable|string|max:250',
            'fullname'           => 'nullable|string|max:250',
            'phone'           => 'nullable|string|max:250',
            'job'           => 'nullable|string|max:250',
            'work'           => 'nullable|string|max:250',
            'nationality'           => 'nullable|string|max:250',
            'token_firebase'           => 'nullable|string|max:250',
            'image'             => 'nullable|file',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }


        //sellect employer
        $employer = Husband::find($employer->id);

        //update data
        if($request->has('password')){
            if(Hash::check($request->oldPassword, $employer->password)){
                $employer->password  = Hash::make($request->get('password'));
                
            } else {
                return response::falid('old password is wrong', 405);
            }
        }

        if($request->has('user_name')){
            $employer->user_name      = $request->get('fullName');
        }
        if($request->has('email')){
            $employer->email         = $request->get('email');
        }

        if($request->has('country_id')){
            $employer->country_id       = $request->get('country_id');
        }
        if($request->has('marrige_type')){
            $employer->marrige_type       = $request->get('marrige_type');
        }
        if($request->has('social_status')){
            $employer->social_status       = $request->get('social_status');
        }
        if($request->has('age')){
            $employer->age       = $request->get('age');
        }
        if($request->has('child_no')){
            $employer->child_no       = $request->get('child_no');
        }

        if($request->has('weight')){
            $employer->weight       = $request->get('weight');
        }

        if($request->has('height')){
            $employer->height          = $request->get('height');
        }

        if($request->has('skin_color')){
            $employer->skin_color       = $request->get('skin_color');
        }

        if($request->has('physique')){
            $employer->physique       = $request->get('physique');
        }

        if($request->has('religiosity')){
            $employer->religiosity       = $request->get('religiosity');
        }

        if($request->has('pray')){
            $employer->pray       = $request->get('pray');
        }

        if($request->has('smoke')){
            $employer->smoke       = $request->get('smoke');
        }

        if($request->has('beard')){
            $employer->beard       = $request->get('beard');
        }
        if($request->has('educational_equal')){
            $employer->educational_equal       = $request->get('educational_equal');
        }
        if($request->has('financial_status')){
            $employer->financial_status       = $request->get('financial_status');
        }
        if($request->has('health_status')){
            $employer->health_status       = $request->get('health_status');
        }
        if($request->has('monthly_income')){
            $employer->monthly_income       = $request->get('monthly_income');
        }
        if($request->has('partner_specification')){
            $employer->partner_specification       = $request->get('partner_specification');
        }
        if($request->has('self_description')){
            $employer->self_description       = $request->get('self_description');
        }
        if($request->has('fullname')){
            $employer->fullname       = $request->get('fullname');
        }
        if($request->has('phone')){
            $employer->phone       = $request->get('phone');
        }
        if($request->has('job')){
            $employer->job       = $request->get('job');
        }
        if($request->has('work')){
            $employer->work       = $request->get('work');
        }
        if($request->has('nationality')){
            $employer->nationality       = $request->get('nationality');
        }
        if($request->has('token_firebase')){
            $employer->token_firebase       = $request->get('token_firebase');
        }

        //updat image
        if($request->has('image')){
            if($employer->image == null){
                $path = rand(0,1000000) . time() . '.' . $request->file('image')->getClientOriginalExtension();
                $request->file('image')->move(base_path('public/uploads/husbands') , $path);
                $employer->image   = $path;
            } else {
                $oldImage = $employer->image;

                //updat image
                $path = rand(0,1000000) . time() . '.' . $request->file('image')->getClientOriginalExtension();
                $request->file('image')->move(base_path('public/uploads/husbands') , $path);
                $employer->image   = $path;

                //delet old image
                if(file_exists(base_path('public/uploads/husbands/') . $oldImage)){
                    unlink(base_path('public/uploads/husbands/') . $oldImage);
                }   
            }
        }


        if($employer->save()){
            return response::suceess('update profile success', 200, 'employer',  new HusbandResource($employer));
        } else {
            return response::falid('update profile falid', 400);
        }
    }
}
