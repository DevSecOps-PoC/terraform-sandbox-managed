/**
 * Copyright (c) Microsoft Corporation. All rights reserved.
 * Licensed under the MIT License. See LICENSE in the project root for
 * license information.
 */

'use strict';
angular.module('todoApp')
    .factory('todoListSvc', ['$http', function ($http) {
        return {
            getItems: function () {
                return $http.get('api/v1/todos/');
            },
            getItem: function (id) {
                return $http.get('api/v1/todos/' + id);
            },
            postItem: function (item) {
                return $http.post('api/v1/todos/', item);
            },
            putItem: function (item) {
                return $http.put('api/v1/todos/', item);
            },
            deleteItem: function (id) {
                return $http({
                    method: 'DELETE',
                    url: 'api/v1/todos/' + id
                });
            }
        };
    }]);
