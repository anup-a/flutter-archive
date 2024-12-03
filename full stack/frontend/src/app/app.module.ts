import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { TaskviewComponent } from './pages/taskview/taskview.component';
import { HttpClientModule } from '@angular/common/http';
import { CreateListComponent } from './pages/create-list/create-list.component';
import { CreateTaskComponent } from './pages/create-task/create-task.component';

@NgModule({
  declarations: [
    AppComponent,
    TaskviewComponent,
    CreateListComponent,
    CreateTaskComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
