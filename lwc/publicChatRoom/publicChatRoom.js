import { LightningElement, track, wire } from 'lwc';
import getRecentMessages from '@salesforce/apex/ChatController.getRecentMessages';
import sendMessage from '@salesforce/apex/ChatController.sendMessage';
import { subscribe, unsubscribe } from 'lightning/empApi';

export default class PublicChatRoom extends LightningElement {
    @track messages = [];
    @track newMessageText = '';
    channelName = '/data/Chat_Message__cChangeEvent';
    subscription = {};

    @wire(getRecentMessages)
    wiredMessages({ error, data }) {
        if (data) {
            this.messages = [...data];
        }
    }

    connectedCallback() {
        subscribe(this.channelName, -1, (response) => {
            this.refreshChat();
        }).then((sub) => {
            this.subscription = sub;
        });
    }

    disconnectedCallback() {
        unsubscribe(this.subscription, () => {});
    }

    handleInputChange(event) {
        this.newMessageText = event.target.value;
    }

    handleKeyUp(event) {
        if (event.keyCode === 13) {
            this.handleSend();
        }
    }

    handleSend() {
        if (!this.newMessageText.trim()) return;

        sendMessage({ messageText: this.newMessageText })
            .then(() => {
                this.newMessageText = '';
            })
            .catch((error) => {
                console.error('Error sending message:', error);
            });
    }

    refreshChat() {
        getRecentMessages().then((data) => {
            this.messages = [...data];
        });
    }
}