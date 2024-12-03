import { Injectable } from '@angular/core';
import { ApicallService } from './apicall.service';

@Injectable({
  providedIn: 'root'
})
export class TaskService {

  constructor(private apicallservice: ApicallService) { }

  createList(title: String) {
    return this.apicallservice.post(`lists`, { title });
  }

  getLists() {
    return this.apicallservice.get(`lists`);
  }

  getTasks(listId) {
    return this.apicallservice.get(`lists/${listId}/tasks`);
  }

  createTask(title: String, listId: String) {
    return this.apicallservice.post(`lists/${listId}/tasks`, { title: title, _listId: listId });
  }

  updateTask(taskId: String, listId: String, payload: object) {
    return this.apicallservice.patch(`lists/${listId}/tasks/${taskId}`, payload);
  }
}
