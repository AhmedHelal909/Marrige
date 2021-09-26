<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Dashboard\BackEndController;

use App\Models\Husband;
use Illuminate\Http\Request;

class HusbandController extends BackEndController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct(Husband $model)
 {
     parent::__construct($model);
 }
    public function index(Request $request)
    {
        
       //get all data of Model
       $rows = $this->model->when($request->search,function($q) use ($request){
        $q->whereTranslationLike('name','%' .$request->search. '%')
          ->orWhereTranslationLike('description','%' .$request->search. '%');
    })->paginate(5);
    $module_name_plural   = $this->getClassNameFromModel();
    $module_name_singular = $this->getSingularModelName();
    // return $module_name_plural;
    return view('dashboard.' . $module_name_plural . '.index', compact('rows', 'module_name_singular', 'module_name_plural'));
    }

   
    public function store(Request $request)
    {
        dd($request);
    }

  
    public function update(Request $request, Husband $black)
    {
        //
    }


    public function destroy($id, Request $request)
    {
        //
    }
}
