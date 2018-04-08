import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { Mission } from './shared/mission.model';
import { MissionService } from './service/mission.service';
import { CookieService } from 'ngx-cookie-service';

@Component({
    selector: 'manageMission-Scheduler',
    templateUrl: './manageMission-Scheduler.component.html'
    // styleUrls: ['manage-mission.component.css']
})
export class ManageMissionSchedulerComponent {
    checkedMissons: Mission[] = [];
    roleCookie: number;
    userId: number;
    constructor(private router: Router,
        private missionService: MissionService, private cookieService: CookieService
    ) { }
    ngOnInit() {
        this.roleCookie = +this.cookieService.get('Auth-RoleId');
        this.userId = +this.cookieService.get('Auth-UserId');
        if (this.roleCookie === 2 || this.roleCookie === 3 || this.roleCookie === 5) {
            // this.loadingService.start();
          this.reload();

        } else if (isNaN(this.roleCookie)) {
            alert('You don\'t have permission to view this page!');
            this.router.navigate(['/login']);
        } else {
            alert('You don\'t have permission to view this page!');
            this.router.navigate(['/main/hospital-portal']);
        }
    }
    reload() {
        this.missionService.getAllByUser(this.cookieService.get('Auth-UserId')).then((res: Mission[]) => {
            this.checkedMissons = res;
        }).catch(err => {
            alert(err);
        });

}
}


