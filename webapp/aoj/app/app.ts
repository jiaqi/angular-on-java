import { Component } from '@angular/core';
import { Thing } from 'angular_on_java/webapp/aoj/app/thing_pb';

@Component({ selector: 'app-component', templateUrl: 'app.html' })
export class App {
    constructor() {
        const thing = new Thing();
        console.log(`The thing: ${thing}`);
    }
}