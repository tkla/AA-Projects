import React from 'react';
import Clock from './clock.jsx';
import Tabs from './tabs'

export default class App extends React.Component {

    constructor(){
        super()
        this.tabs = [{
            title: '1',
            content: 'Stuff'
        }, 
        {
            title: '2',
            content: 'This is tab 2'
        },
        {
            title: '3',
            content: 'Last tab content'
        }]
    }

    render(){
        return (
            <div id="app">
                <Clock/>
                <Tabs tabs={this.tabs}/>
            </div>
        );
    }

}
