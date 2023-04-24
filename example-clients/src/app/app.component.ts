import { Component, OnInit } from '@angular/core';
import { KeycloakService } from 'keycloak-angular';
import * as Keycloak from 'keycloak-js';
import { KeycloakProfile, KeycloakTokenParsed } from 'keycloak-js';
import { HttpCrudDemoService } from './http-crud-demo.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent implements OnInit {
  public isLoggedIn = false;
  public userProfile: KeycloakProfile | null = null;
  public userDetails: KeycloakTokenParsed | undefined = undefined;
  public userDetailsString : string | null = null;
  public expDate : Date | null = null;

  title = 'todo';

  allItems = [];

  addItem(task) {
    let item = {
      task: task,
      completed: false,
    };

    this.httpCrudDemoService.addPost(item).subscribe(res => {
      this.allItems.unshift(res)
    });
  }

  updateItem(item) {
    this.httpCrudDemoService.updatePost(item).subscribe(res => {
      const item = this.allItems.find(item => item.id === res.id);
      item.task = res.task;
      item.completed = res.completed;

    });
  }

  remove(item) {
    this.allItems.splice(this.allItems.indexOf(item), 1);

    this.httpCrudDemoService.deletePost(item.id).subscribe();
  }

  get items() {
      return this.allItems;
  }

  constructor(private readonly keycloak: KeycloakService, private readonly httpCrudDemoService: HttpCrudDemoService) { }

  public async ngOnInit() {
    this.isLoggedIn = await this.keycloak.isLoggedIn();

    if (this.isLoggedIn) {
      this.httpCrudDemoService.getPosts().subscribe(res => {
        this.allItems = res;
      })
      this.userProfile = await this.keycloak.loadUserProfile();
    }
    try {
      this.userDetails = await this.keycloak.getKeycloakInstance().tokenParsed;
      this.userDetailsString = JSON.stringify(this.userDetails?.exp);
      var d = new Date(0);
      d.setUTCSeconds(parseInt(this.userDetailsString));
      this.expDate = new Date(d);
    } catch (e){
      console.log('Failed to load user details', e);
    }
  }

  public login() {
    this.keycloak.login();
  }

  public logout() {
    this.keycloak.logout();
  }
}
