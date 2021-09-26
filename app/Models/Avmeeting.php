<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Job;
class Avmeeting extends Model
{
    protected $guarded=[];
    public function job()
    {
        return $this->belongsTo(Job::class);
    }
    // public function employee_job()
    // {
    //     return $this->hasOne('App\Models\EmployeeJob', 'avmeeting_id');
    // }
    protected $casts = [
        'available' => 'integer',
    ];
}
