<?php

namespace App\Http\Resources;

use App\Models\Avmeeting;
use App\Models\EmployeeJob;
use App\Models\job;
use Illuminate\Http\Resources\Json\JsonResource;

class notificationResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'                => $this->id,
            'type'              => $this->type,
            'employee_id'       => $this->employee_id,
            'title'             => $this->title,
            'body'              => $this->body,
            'candate_id'        => $this->candate_id,
            'job_id'            => ($this->candate_id != null) ? EmployeeJob::find($this->candate_id)->job_id : null,
            'meeting_date'      => ($this->candate_id != null) ? new avmeetingResource(Avmeeting::find(EmployeeJob::find($this->candate_id)->avmeeting_id)) : $this->meeting_date,
            'viedo_channel_name'=> $this->viedo_channel_name,
            'viedo_token'       => $this->viedo_token,
        ];
    }
}
