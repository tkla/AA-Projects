import React from 'react'

export default class Tabs extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            selected: 0,
        }
        this.changeTab = this.changeTab.bind(this)
        this.content = ""
    }

    changeTab(index){
        this.content = this.props.tabs[index]
        this.setState({
            selected: index 
        })
    }

    render(){
        return(
            <div>
                <ul>
                    {this.props.tabs.map( (e, i) =>{
                        <h1 onClick={()=> this.changeTab(i)}>{e.title}</h1>
                    })}
                </ul>
                <article>{this.content}</article>
            </div>
        )
    }
}