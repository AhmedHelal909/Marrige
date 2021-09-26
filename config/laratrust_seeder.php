<?php

return [
    'role_structure' => [
        'super' => [
            'users'      => 'c,r,u,d',
            'roles'      => 'c,r,u,d',
            'husbands'      => 'c,r,u,d',
            




            
        ],
    ],
    // 'permission_structure' => [
    //     'cru_user' => [
    //         'profile' => 'c,r,u'
    //     ],
    // ],
    'permissions_map' => [
        'c' => 'create',
        'r' => 'read',
        'u' => 'update',
        'd' => 'delete'
    ]
];
