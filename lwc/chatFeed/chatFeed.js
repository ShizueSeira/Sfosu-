import { LightningElement, wire } from 'lwc';
import getRecentMessages from '@salesforce/apex/RecentChatFeedController.getRecentMessages';

export default class ChatFeed extends LightningElement {
    @wire(getRecentMessages) 
    messages;
}