<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class employeeChatResource extends JsonResource
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
            'id'            => $this->id,
            'fullName'      => $this->fullName,
            'image'         => ($this->image != null) ? (url('/') . '/uploads/employee/image/' . $this->image) : (url('/') . '/uploads/employee/image/default.jpg'),
        ];
    }
}
