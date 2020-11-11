import React, { Component } from 'react'
import axios from 'axios';
import { exception } from 'console';

class ApiResponse extends Component {
    state = {
        response: []
    };
    
    getResponse() {
        return axios.get("localhost:8080/views")
            .then(result => {
                result
            })
            .catch(err =>  {
                throw new Error(err);
            })
    }

    render() {
        
    }
}
