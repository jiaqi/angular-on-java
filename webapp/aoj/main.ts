import { platformBrowser } from '@angular/platform-browser';
import { AppModuleNgFactory } from './app/app_module.ngfactory';
import { enableProdMode } from '@angular/core';

enableProdMode()
platformBrowser().bootstrapModuleFactory(AppModuleNgFactory);
