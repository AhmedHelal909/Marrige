<?php

namespace App\Http\Controllers\Api\site;

use App\CustomClass\response;
use App\Http\Resources\employeeResource;
use App\Http\Resources\employerResource;
use App\Models\Employees;
use App\Models\Employer;
use App\Models\Husband;
use App\Models\Wife;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Validation\Rule;

class register extends Controller
{
    public function registerEmployee(Request $request){
        $validator = Validator::make($request->all(), [
            'fullName'         => 'required|string',
            'email'             => 'required|string|email|max:255|unique:employees',
            'password'          => 'required|string|min:6',
            'confirmPassword'   => 'required|string|same:password',
            'country'           => 'required|string',
            'city'              => 'required|string',
            
            'title'             => 'required|string|max:250',
            'qualification'     => 'required|string|max:250',
            'university'        => 'required|string|max:250',
            'graduation_year'   => 'required|integer|max:5000',
            'experience'        => 'required|integer',
            'study_field'       => 'required|string|max:250',
            'deriving_licence'  => 'required|boolean',
            'birth'             => 'required|string',
            'deriving_licence'  => ['required',Rule::in(0,1)],      //0->no 1->yes
            'gender'            => ['required',Rule::in(0,1,2)],    //0->male  1->female 2->other
            'skills'            => 'array|required',
            'skills.*'          => 'required|string',
            'industry'          => 'required|exists:categories,id|integer',
            'languages'         => 'array|required',
            'languages.*'       => 'required|string',
            'cv'                => 'nullable|mimes:doc,pdf,docx',
            'audio'             => 'nullable|file',
            'video'             => 'nullable|mimes:mp4,mov,ogg',
            'image'             => 'nullable|mimes:jpg,jpeg,png,svg',
            'token_firebase'    => 'required',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        $employee = Employees::create([
            'fullName'          => $request->get('fullName'),
            'email'             => $request->get('email'),
            'country'           => $request->get('country'),
            'city'              => $request->get('city'),
            'password'          => Hash::make($request->get('password')),

            'category_id'      => $request->get('industry'),
            'experience'       => $request->get('experience'),
            'title'            => $request->get('title'),
            'qualification'    => $request->get('qualification'),
            'university'       => $request->get('university'),
            'graduation_year'  => $request->get('graduation_year'),
            'study_field'      => $request->get('study_field'),
            'deriving_licence' => $request->get('deriving_licence') ,
            'birth'            => $request->get('birth'),
            'gender'           => $request->get('gender'),
            'languages'        => $request->get('languages'),           
            'skills'           => $request->get('skills'),
            'token'            => $request->get('token_firebase'),
        ]);

        if($request->has('cv')){
            $path = rand(0,1000000) . time() . '.' . $request->file('cv')->getClientOriginalExtension();
            $request->file('cv')->move(base_path('public/uploads/employee/cv') , $path);
            $employee->cv   = $path;
        }


        //updat audio
        if($request->has('audio')){
            $path = rand(0,1000000) . time() . '.' . $request->file('audio')->getClientOriginalExtension();
            $request->file('audio')->move(base_path('public/uploads/employee/audio') , $path);
            $employee->audio   = $path;
        }

        //updat video
        if($request->has('video')){
            $path = rand(0,1000000) . time() . '.' . $request->file('video')->getClientOriginalExtension();
            $request->file('video')->move(base_path('public/uploads/employee/video') , $path);
            $employee->video   = $path;
        }

        //updat image
        if($request->has('image')){
            $path = rand(0,1000000) . time() . '.' . $request->file('image')->getClientOriginalExtension();
            $request->file('image')->move(base_path('public/uploads/employee/image') , $path);
            $employee->image   = $path;
        }

        $employee->save();

        $token = JWTAuth::fromUser($employee);

        return response()->json([
            "status" => true,
            'message'=> 'register success',
            'employee'   => new employeeResource($employee),
            'token'  => $token,
        ], 200);
    }
    public function registerHusband(Request $request){
        $validator = Validator::make($request->all(), [
            'user_name'         => 'required|string|max:255|unique:husbands',
            'email'             => 'required|string|email|max:255|unique:husbands',
            'password'          => 'required|string|min:6',
            'confirmPassword'   => 'required|string|same:password',
            'nationality'           => 'required|string',
            'country_id'           => 'required|string',
            'marrige_type'           => 'required|string',
            'social_status'           => 'required|string',
            'age'           => 'required|string',
            'child_no'           => 'required|string',
            'weight'           => 'required|string',
            'height'           => 'required|string',
            'skin_color'           => 'required|string',
            'physique'           => 'required|string',
            'religiosity'           => 'required|string',
            'pray'           => 'required|string',
            'smoke'           => 'required|string',
            'beard'           => 'required|string',
            'educational_equal'           => 'required|string',
            'financial_status'           => 'required|string',
            'work'           => 'required|string',
            'job'           => 'required|string',
            'health_status'           => 'required|string',
            'monthly_income'           => 'required|string',
            'partner_specification'           => 'required|string',
            'self_description'           => 'required|string',
            'fullname'           => 'required|string',
            'phone'           => 'required|string',
            'image'             => 'required|mimes:jpg,jpeg,png,svg',
            'token_firebase'    => 'required',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }
           //updat image
           if($request->has('image')){
            $path = rand(0,1000000) . time() . '.' . $request->file('image')->getClientOriginalExtension();
            $request->file('image')->move(base_path('public/uploads/husbands') , $path);

        }
    
        $employee = Husband::create([
            'user_name'          => $request->get('user_name'),
            'email'             => $request->get('email'),
            'password'          => Hash::make($request->get('password')),
            'country_id'           => $request->get('country_id'),
            'marrige_type'           => $request->get('marrige_type'),
            'social_status'           => $request->get('social_status'),
            'age'           => $request->get('age'),
            'child_no'           => $request->get('child_no'),
            'weight'           => $request->get('weight'),
            'height'           => $request->get('height'),
            'skin_color'           => $request->get('skin_color'),
            'physique'           => $request->get('physique'),
            'religiosity'           => $request->get('religiosity'),
            'pray'           => $request->get('pray'),
            'smoke'           => $request->get('smoke'),
            'beard'           => $request->get('beard'),
            'educational_equal'           => $request->get('educational_equal'),
            'financial_status'           => $request->get('financial_status'),
            'health_status'           => $request->get('health_status'),
            'monthly_income'           => $request->get('monthly_income'),
            'partner_specification'           => $request->get('partner_specification'),
            'self_description'           => $request->get('self_description'),
            'fullname'           => $request->get('fullname'),
            'phone'           => $request->get('phone'),
            'job'           => $request->get('job'),
            'work'           => $request->get('work'),
            'nationality'           => $request->get('nationality'),
            'token_firebase'        =>$request->get('token_firebase'),
            'image'                 =>$path,
            
        ]);

  

   
 

     

        if($employee->save())
            $token = JWTAuth::fromUser($employee);

        return response()->json([
            "status" => true,
            'message'=> 'register success',
            'employee'   =>$employee,
            'token'  => $token,
        ], 200);
    }
    public function registerWife(Request $request){
        $validator = Validator::make($request->all(), [
            'user_name'         => 'required|string|max:255|unique:wives',
            'email'             => 'required|string|email|max:255|unique:wives',
            'password'          => 'required|string|min:6',
            'confirmPassword'   => 'required|string|same:password',
            'nationality'           => 'required|string',
            'country_id'           => 'required|string',
            'marrige_type'           => 'required|string',
            'social_status'           => 'required|string',
            'age'           => 'required|string',
            'child_no'           => 'required|string',
            'weight'           => 'required|string',
            'height'           => 'required|string',
            'skin_color'           => 'required|string',
            'physique'           => 'required|string',
            'religiosity'           => 'required|string',
            'pray'           => 'required|string',
            'smoke'           => 'required|string',
            'hijab'           => 'required|string',
            'educational_equal'           => 'required|string',
            'financial_status'           => 'required|string',
            'work'           => 'required|string',
            'job'           => 'required|string',
            'health_status'           => 'required|string',
            'monthly_income'           => 'required|string',
            'partner_specification'           => 'required|string',
            'self_description'           => 'required|string',
            'fullname'           => 'required|string',
            'phone'           => 'required|string',
            'image'             => 'required|mimes:jpg,jpeg,png,svg',
            'token_firebase'    => 'required',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }
           //updat image
           if($request->has('image')){
            $path = rand(0,1000000) . time() . '.' . $request->file('image')->getClientOriginalExtension();
            $request->file('image')->move(base_path('public/uploads/wives') , $path);

        }
    
        $employee = Wife::create([
            'user_name'          => $request->get('user_name'),
            'email'             => $request->get('email'),
            'password'          => Hash::make($request->get('password')),
            'country_id'           => $request->get('country_id'),
            'marrige_type'           => $request->get('marrige_type'),
            'social_status'           => $request->get('social_status'),
            'age'           => $request->get('age'),
            'child_no'           => $request->get('child_no'),
            'weight'           => $request->get('weight'),
            'height'           => $request->get('height'),
            'skin_color'           => $request->get('skin_color'),
            'physique'           => $request->get('physique'),
            'religiosity'           => $request->get('religiosity'),
            'pray'           => $request->get('pray'),
            'smoke'           => $request->get('smoke'),
            'hijab'           => $request->get('hijab'),
            'educational_equal'           => $request->get('educational_equal'),
            'financial_status'           => $request->get('financial_status'),
            'health_status'           => $request->get('health_status'),
            'monthly_income'           => $request->get('monthly_income'),
            'partner_specification'           => $request->get('partner_specification'),
            'self_description'           => $request->get('self_description'),
            'fullname'           => $request->get('fullname'),
            'phone'           => $request->get('phone'),
            'job'           => $request->get('job'),
            'work'           => $request->get('work'),
            'nationality'           => $request->get('nationality'),
            'token_firebase'        =>$request->get('token_firebase'),
            'image'                 =>$path,
            
        ]);

  

   
 

     

        if($employee->save())
            $token = JWTAuth::fromUser($employee);

        return response()->json([
            "status" => true,
            'message'=> 'register success',
            'employee'   =>$employee,
            'token'  => $token,
        ], 200);
    }

    public function registerEmpolyer(Request $request){
        $validator = Validator::make($request->all(), [
            'fullName'          => 'required|string',
            'email'             => 'required|string|email|max:255|unique:employers',
            'password'          => 'required|string|min:6',
            'confirmPassword'   => 'required|string|same:password',
            'title'             => 'required|string',
            'mobile_number1'    => 'required|string|min:8',
            'mobile_number2'    => 'nullable|string|min:8',

            'company_name'      => 'required|string|max:250',
            'business'          => 'required|exists:categories,id|integer',
            'established_at'    => 'required|string|max:250',
            'website'           => 'required|string|max:250',
            'country'           => 'required|string|max:250',
            'city'              => 'required|string|max:250',
            'image'             => 'nullable|mimes:jpg,jpeg,png,svg',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        $employer = Employer::create([
            'fullName'          => $request->get('fullName'),
            'email'             => $request->get('email'),
            'title'             => $request->get('title'),
            'mobile_number1'    => $request->get('mobile_number1'),
            'password'          => Hash::make($request->get('password')),

            
            'company_name'      => $request->get('company_name'),
            'business'          => $request->get('business'),
            'established_at'    => $request->get('established_at'),
            'website'           => $request->get('website'),
            'country'           => $request->get('country'),
            'city'              => $request->get('city'),
        ]);

        //phone 2
        if($request->has('mobile_number2')){
            $employer->mobile_number2   = $request->get('mobile_number2');
            $employer->save();
        }

        //add image
        if($request->has('image')){
            //add image
            $path = rand(0,1000000) . time() . '.' . $request->file('image')->getClientOriginalExtension();
            $request->file('image')->move(base_path('public/uploads/employer/image') , $path);
            $employer->image   = $path;
            $employer->save();
        }

        $token = JWTAuth::fromUser($employer);

        $employer = Employer::find($employer->id);

        return response()->json([
            "status"    => true,
            'message'   => 'register success',
            'employer'   => new employerResource($employer),
            'token'     => $token,
        ], 200);
    }
}
