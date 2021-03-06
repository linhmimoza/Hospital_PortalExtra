import { Component, OnInit } from '@angular/core';
import * as $ from 'jquery';
import 'fullcalendar';

@Component({
  selector: 'app-demo-schedule',
  templateUrl: './demo-schedule.component.html',
  styleUrls: ['./demo-schedule.component.css']
})
export class DemoScheduleComponent implements OnInit {
  scheduler: any;
  constructor() { }


  getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

  ngOnInit() {

  }
  ngAfterViewInit() {
    this.scheduler = $('#calendarDemo');
    this.scheduler.fullCalendar({
      defaultView: 'agendaWeek',
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'agendaWeek,agendaDay'
      },
      editable: true,
      eventDrop: (event) => {
        console.log(event.id);
        console.log(event.title);
        console.log(event.start);
        console.log(event.end);
      },
      eventResize: (event) => {
        console.log(event.id);
        console.log(event.title);
        console.log(event.start);
        console.log(event.end);
      },
      events: [
        // {
        //   id: 'aa',
        //   title: 'Event A',
        //   start: '2018-03-20T17:00',
        //   end: '2018-03-20T19:00'
        // }
      ],
      dayClick: (options) => {
        let year = options.year();
        let month = options.month();
        let date = options.date();
        let hour = options.hour();
        let minute = options.minute();
        let events = {
          id: year + (month + 1) + date + ' ' + this.getRandomInt(1, 10000),
          title: 'Title ' + year + (month + 1) + date,
          start: new Date(year, month, date, hour, minute),
          end: new Date(year, month, date, hour + 1, minute),
        }
        this.scheduler.fullCalendar('renderEvent', events);
      },
      eventClick: (options) => {
        console.log(options.title);
        console.log(options.start);
        console.log(options.end);
      },
    });
  }
}
