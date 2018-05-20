import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component ({
    selector: 'home',
    templateUrl: './homepage.component.html'
})

export class HomepageComponent {
    constructor (private router: Router){

    }
}