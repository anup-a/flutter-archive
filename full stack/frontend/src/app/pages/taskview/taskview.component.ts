import { Component, OnInit } from '@angular/core';
import { TaskService } from 'src/app/task.service';
import { ActivatedRoute, Params } from '@angular/router';

@Component({
  selector: 'app-taskview',
  templateUrl: './taskview.component.html',
  styleUrls: ['./taskview.component.scss']
})
export class TaskviewComponent implements OnInit {

  lists: any[];
  tasks: any[];
  listId: any;

  constructor(private taskService: TaskService, private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.route.params.subscribe(
      (params: Params) => {
        this.listId = params.listId;

        this.taskService.getTasks(this.listId).subscribe((tasks: any[]) => {
          console.log(tasks);
          this.tasks = tasks;
        });

      });

    this.taskService.getLists().subscribe((lists: any[]) => {
      this.lists = lists;
    });
  }

  onComplete(task) {
    this.taskService.updateTask(task._id, task._listId, { completed: !task.completed }).subscribe((response) => {
      console.log(response);
      task.completed = !task.completed;
    });
  }

}
