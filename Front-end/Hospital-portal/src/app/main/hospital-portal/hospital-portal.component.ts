import { Component } from "@angular/core";
import { Router } from "@angular/router";
import { NotificationComponentService } from "../notification/service/notification.component.service";
import { NotificationService } from "../extra/notification.service";
import { LoadingService } from "../extra/loading.service";
import { CookieService } from "ngx-cookie-service";
import { Notification } from "../notification/shared/notification.model";
declare var $: any;

@Component({
    selector: 'hospital-portal',
    templateUrl: './hospital-portal.component.html'
    // styleUrls:['user-list.component.css']
})
export class HospitalPortalComponent {
    roleCookie: number;
    notifications: Notification[] = [];
    selectedNotification: Notification = new Notification;
    constructor(private router: Router, private notificationComponentService: NotificationComponentService,
        private notificationService: NotificationService,
        private loadingService: LoadingService, private cookieService: CookieService) {

    }
    ngOnInit() {
        this.roleCookie = +this.cookieService.get("Auth-RoleId");
        if ((this.roleCookie >= 1 ) && (this.roleCookie <= 6)) {
            this.loadingService.start();
            this.notificationComponentService.getActivateNotification().then((res: Notification[]) => {
                this.notifications = res;
            }).catch(err => {
                alert(err);
            });
            this.loadingService.stop();
        } else if (isNaN(this.roleCookie)) {
            alert("You don't have permission to view this page!");
            this.router.navigate(['/login']);
        } else {
            alert("You don't have permission to view this page!");
            this.router.navigate(['/main/hospital-portal']);
        }

    }

    view(notification) {
        // this.loadScrip()
        this.selectedNotification = notification;
        $('#modalLG').modal('show');
        // this.loadScrip();
    }
}
