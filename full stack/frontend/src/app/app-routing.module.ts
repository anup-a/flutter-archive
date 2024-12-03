import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { TaskviewComponent } from './pages/taskview/taskview.component';
import { CreateListComponent } from './pages/create-list/create-list.component';
import { CreateTaskComponent } from './pages/create-task/create-task.component';


const routes: Routes = [
  { path: '', redirectTo: '/lists', pathMatch: 'full' },
  { path: 'new-list', component: CreateListComponent },
  { path: 'lists', component: TaskviewComponent },
  { path: 'lists/:listId', component: TaskviewComponent },
  { path: 'lists/:listId/new-task', component: CreateTaskComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
