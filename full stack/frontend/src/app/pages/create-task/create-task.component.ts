import { Component, OnInit } from '@angular/core';
import { TaskService } from 'src/app/task.service';
import { ActivatedRoute, Params, Router } from '@angular/router';

@Component({
  selector: 'app-create-task',
  templateUrl: './create-task.component.html',
  styleUrls: ['./create-task.component.scss']
})
export class CreateTaskComponent implements OnInit {

  listId: String;

  constructor(private taskService: TaskService, private route: ActivatedRoute, private router: Router) { }

  ngOnInit(): void {
    this.route.params.subscribe(
      (params: Params) => {
        this.listId = params.listId;
      });
  }

  createNewTask(title: String) {
    this.taskService.createTask(title, this.listId).subscribe((response) => {
      this.router.navigate(['../'], { relativeTo: this.route });
    });
  }


}
