<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Tymon\JWTAuth\Contracts\JWTSubject;


class Employees extends Authenticatable implements JWTSubject
{
    use Notifiable;
    protected $table = 'employees';


    protected $guard = 'employee';

    protected $hidden = [
        'password'
    ];  
    protected $appended=['image_path','cv_path','audio_path','video_path'];

    protected $guarded = [];

    // protected $fillable = [
    //     'id','fullName','email','password','country','city','industry','title',
    //     'qualification','university','graduation_year','study_field','deriving_licence',
    //     'state','skills','languages','cv','audio','video','birth','gender', 'image'
    // ];



    protected $casts = [
        'skills'=> 'array',
        'languages'=> 'array',
        'graduation_year' => 'integer',
        'deriving_licence'=> 'integer',
        'gender' => 'integer',
        'experience'=> 'integer',
        // 'category_id'=> 'array',
    ];

    public function report()
    {
        return $this->hasMany('App\Models\Report', 'employee_id');
    }

    public function category()
    {
        return $this->belongsTo('App\Models\Category', 'category_id');
    }

    public function EmployeeJob()
    {
        return $this->hasMany('App\Models\EmployeeJob', 'employee_id');
    }

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    // public function chat(){
    //     return $this->hasMany(Chat::class, 'employee_id');
    // }

    public function employeeChat(){
        return $this->hasMany(EmployeeChat::class, 'employee_id');
    }

    public function employerChat(){
        return $this->hasMany(EmployerChat::class, 'employee_id');
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [
            'type'       => 'Employee'
        ];
    }

    public function getImagePathAttribute()
    {
        return $this->image !=null ? asset('uploads/employee/image/' . $this->image) : 'No IMAGE'; 
    }
    
    public function getVideoPathAttribute()
    {
        return $this->video !=null ? asset('uploads/employee/video/' . $this->video) : 'No Video'; 
    }
    
    public function getAudioPathAttribute()
    {
        return $this->audio !=null ? asset('uploads/employee/audio/' . $this->audio) : 'No Audio'; 
    }
    
    public function getCvPathAttribute()
    {
        return $this->cv !=null ? asset('uploads/employee/cv/' . $this->cv) : 'No CV'; 
    }
}
