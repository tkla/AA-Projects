import React from 'react';

export default class Clock extends React.Component {
    constructor(prop){
        super(prop)
        this.state = {
            date: new Date()
        }
        this.intervals = [];
        this.tick = this.tick.bind(this)
    }

    componentDidMount(){
        const tickInterval = setInterval(()=>{
            this.tick()
        } ,1000)
        this.intervals.push(tickInterval);
    }

    componentWillUnmount(){
        this.intervals.forEach((e) => {
            clearInterval(e);
        });
    }

    tick(){
        this.setState({
            date: new Date()
        })
    }

    render(){
        return (
            <div id='clock'>
                <h1>Time:</h1>
                <h1 className="right">{this.state.date.toTimeString()}</h1>
                <h1>Date:</h1>
                <h1 className="right">{this.state.date.toDateString()}</h1>
            </div>
        );
    }
}