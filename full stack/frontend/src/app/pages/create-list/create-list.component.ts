import { Component, OnInit } from '@angular/core';
import { TaskService } from 'src/app/task.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-create-list',
  templateUrl: './create-list.component.html',
  styleUrls: ['./create-list.component.scss']
})
export class CreateListComponent implements OnInit {

  constructor(private taskService: TaskService, private router: Router) { }

  ngOnInit(): void {
  }

  createNewList(title: String) {
    this.taskService.createList(title).subscribe((response) => {
      this.router.navigate(['/lists', response._id]);
    });
  }
}
