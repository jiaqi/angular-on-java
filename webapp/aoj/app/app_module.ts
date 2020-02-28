import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';


import { App } from './app';

@NgModule({
  declarations: [App],
  imports: [
    BrowserModule, BrowserAnimationsModule,
  ],
  exports: [App],
  bootstrap: [App],
})
export class AppModule {
}