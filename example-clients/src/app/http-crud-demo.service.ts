import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class HttpCrudDemoService {
  url: string;

  constructor(private httpClient: HttpClient) {
    this.url = "http://localhost:8082/todo";
  }

  public getPosts(): Observable<any[]> {
    return this.httpClient.get<any[]>(this.url);
  }

  public addPost(postData: Object): Observable<object> {
    return this.httpClient.post<object>(this.url, postData);
  }

  public updatePost(postData: Object): Observable<any> {
      console.log(postData);
    return this.httpClient.put<any>(this.url, postData);
  }

  public deletePost(id: number) {
    console.log(id);

    const httpParams = new HttpParams().set('id', id);
    return this.httpClient.delete<string>(this.url, {params: httpParams});
  }
}
