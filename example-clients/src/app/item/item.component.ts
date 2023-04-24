import { Component, Input, Output, EventEmitter } from '@angular/core';
import { Item } from "../item";
import { AppComponent } from '../app.component';

@Component({
  selector: 'app-item',
  templateUrl: './item.component.html',
  styleUrls: ['./item.component.css']
})
export class ItemComponent {
  editable = false;

    @Input() item: Item;
    @Input() newItem: string;
    @Output() remove = new EventEmitter<Item>();

    constructor(private readonly appComponent: AppComponent) { }


    saveItem(task) {
      if (!task) return;
      this.editable = false;
      this.item.task = task;

      this.appComponent.updateItem(this.item);
    }

    saveComplete(complete) {
      console.log(complete);
      this.item.completed = complete;

      this.appComponent.updateItem(this.item);
    }
}
