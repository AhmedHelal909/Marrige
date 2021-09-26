<?php

namespace App\Http\Controllers\Api\site;

use App\CustomClass\response;
use App\Http\Controllers\Controller;
use App\Http\Resources\employeeResource;
use App\Http\Resources\employerResource;
use App\Http\Resources\jobResource;
use App\Models\CategoryTranslation;
use App\Models\Employees;
use App\Models\Employer;
use App\Models\job;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class guestController
{
    public function mainPage(){
        return response::suceess('success', 200, 'jobs',jobResource::collection(job::where('status', '=', 1)->get()));
    }

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

        return response::suceess('success', 200, 'jobDetails',new jobResource($job));
    }

    public function categories(Request $request){
        if($request->get('lang') == 'ar'){
            $categories = CategoryTranslation::where('locale', '=', $request->get('lang'))->get();
        } else{
            $categories = CategoryTranslation::where('locale', '=', 'en')->get();
        }

        return $categories->makeHidden('id');
    }
}
