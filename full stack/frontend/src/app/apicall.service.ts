import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ApicallService {

  readonly ROOT_URL;

  constructor(private http: HttpClient) {
    this.ROOT_URL = 'http://localhost:8000';
  }

  get(uri: string) {
    console.log(`${this.ROOT_URL}/${uri}`);
    return this.http.get(`${this.ROOT_URL}/${uri}`);
  }

  post(uri: string, payload: object) {
    console.log(`${this.ROOT_URL}/${uri}`);
    return this.http.post(`${this.ROOT_URL}/${uri}`, payload);
  }

  patch(uri: string, payload: object) {
    console.log(payload);
    return this.http.patch(`${this.ROOT_URL}/${uri}`, payload);
  }

  delete(uri: string) {
    return this.http.delete(`${this.ROOT_URL}/${uri}`);
  }

}