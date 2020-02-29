import { platformBrowser } from '@angular/platform-browser';
import { AppModuleNgFactory } from './app/app_module.ngfactory';

platformBrowser().bootstrapModuleFactory(AppModuleNgFactory);
