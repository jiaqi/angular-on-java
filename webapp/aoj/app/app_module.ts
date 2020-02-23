import {NgModule} from '@angular/core';
import {App} from './app';
import {BrowserModule} from '@angular/platform-browser';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';

@NgModule({
  declarations: [App],
  imports: [
    // BrowserModule,
    // BrowserAnimationsModule
  ],
  exports: [App],
  bootstrap: [App],
})
export class AppModule {
}
