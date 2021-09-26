<?php

namespace App\Http\Controllers\Api\site;

use App\CustomClass\response;
use App\Http\Resources\employeeResource;
use App\Http\Resources\employerResource;
use App\Models\Employees;
use App\Models\Employer;
use App\Models\Husband;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Facades\JWTAuth;

class authentication extends Controller
{
    public function authenticate(Request $request){
        $guard = $request->route()->getName();
     //husband
        if($guard == 'husband'){
            $validator = Validator::make($request->all(), [
                'email' => 'required',
                'password' => 'required',
                'token_firebase'    => 'nullable',
            ]);
        } else {
            $validator = Validator::make($request->all(), [
                'email' => 'required',
                'password' => 'required',
            ]);
        }

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }
        
        if($guard == 'husband'){
            $credentials = ['email' => $request->email, 'password' => $request->password];
        } else {
            $credentials = ['email' => $request->email, 'password' => $request->password];
        }
        try {
            if (! $token = auth($guard)->attempt($credentials)) {
                return response::falid('passwored or email is wrong', 400);
            }
        } catch (JWTException $e) {
            return response::falid('some thing is wrong', 500);
        }

        if($guard == 'husband'){
            // if user auth by employee guard
            if (! $employee = auth('husband')->user()) {
                return response::falid('user_not_found', 404);
            }

            if($employee->block == 1){
                return response()->json([
                    'status'  => false,
                    'message' => 'this acount is bloked',
                ], 200);
            }

            //update firbase token
            // $employee = Husband::find($employee->id);
            // $employee->token_firebase = $request->get('token_firebase');
            // $employee->save();

            return response()->json([
                'status'  => true,
                'message' => 'succeess',
                'employee'=> $employee,
                'token' => $token,
            ], 200);
        } else {
            // if user auth by employe guard
            if (! $employer = auth('wife')->user()) {
                return response::falid('user_not_found', 404);
            }

            //update firbase token
            // $employer = Husband::find($employer->id);
            // $employer->token_firebase = $request->get('token_firebase');
            // $employer->save();

            return response()->json([
                'status'  => true,
                'message' => 'succeess',
                'employer'=> $employer,
                'token' => $token,
            ], 200);
        }
        //wife
        
        if($guard == 'wife'){
            $validator = Validator::make($request->all(), [
                'email' => 'required',
                'password' => 'required',
                'token_firebase'    => 'nullable',
            ]);
        } else {
            $validator = Validator::make($request->all(), [
                'email' => 'required',
                'password' => 'required',
            ]);
        }

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }
        
        if($guard == 'wife'){
            $credentials = ['email' => $request->email, 'password' => $request->password];
        } else {
            $credentials = ['email' => $request->email, 'password' => $request->password];
        }
        try {
            if (! $token = auth($guard)->attempt($credentials)) {
                return response::falid('passwored or email is wrong', 400);
            }
        } catch (JWTException $e) {
            return response::falid('some thing is wrong', 500);
        }

        if($guard == 'wife'){
            // if user auth by employee guard
            if (! $employee = auth('husband')->user()) {
                return response::falid('user_not_found', 404);
            }

            if($employee->block == 1){
                return response()->json([
                    'status'  => false,
                    'message' => 'this acount is bloked',
                ], 200);
            }

            //update firbase token
            // $employee = Husband::find($employee->id);
            // $employee->token_firebase = $request->get('token_firebase');
            // $employee->save();

            return response()->json([
                'status'  => true,
                'message' => 'succeess',
                'employee'=> $employee,
                'token' => $token,
            ], 200);
        } else {
            // if user auth by employe guard
            if (! $employer = auth('employer')->user()) {
                return response::falid('user_not_found', 404);
            }

            //update firbase token
            // $employer = Husband::find($employer->id);
            // $employer->token_firebase = $request->get('token_firebase');
            // $employer->save();

            return response()->json([
                'status'  => true,
                'message' => 'succeess',
                'employer'=> $employer,
                'token' => $token,
            ], 200);
        }
    }

    public function socialiteAuthenticate(Request $request){
        // $guard = $request->route()->getName();

        $validator = Validator::make($request->all(), [
            'email' => 'required',
            'email_id' => 'required',
            'fullName' => 'required',
        ]);

        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }

        $employee = Employees::where('email', '=', $request->email)->first();

        if($employee == null){
            $employee = Employees::create([
                'fullName'          => $request->get('fullName'),
                'email'             => $request->get('email'),
                'password'          => Hash::make(''),
                'socialite_id'      => $request->get('email_id'),
            ]);
    
            $token = JWTAuth::fromUser($employee);
    
            return response()->json([
                "status" => true,
                'message'=> 'register success',
                'employee'   => new employeeResource($employee),
                'token'  => $token,
            ], 200);
        } else {

            $credentials = ['email' => $request->email, 'password' =>  '','socialite_id' => $request->email_id];

            if($employee->block == 1){
                return response()->json([
                    'status'  => false,
                    'message' => 'this acount is bloked',
                ], 200);
            }

            try {
                if (! $token = auth('employee')->attempt($credentials)) {
                    return response::falid('try again this emil not for you', 404);
                }
            } catch (JWTException $e) {
                return response::falid('some thing is wrong', 500);
            }
            return response()->json([
                "status" => true,
                'message'=> 'login success',
                'employee'   => new employeeResource($employee),
                'token'  => $token,
            ], 200);
        }
    }
    
    public function logout(Request $request){
        $guard = $request->route()->getName();

        Auth::guard($guard)->logout();

        return response::suceess('logout success', 200);
    }
}
