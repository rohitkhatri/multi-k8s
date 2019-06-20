import React, {Component} from 'react';
import axios from 'axios';

class Fib extends Component {
    state = {
        seenIndexes: [],
        values: {},
        index: ''
    };

    componentDidMount() {
        this.fetchValues();
        this.fetchIndexes();
    }

    async fetchValues() {
        const values = await axios.get('/api/values/current');
        this.setState({values: values.data});
    }

    async fetchIndexes() {
        const indexes = await axios.get('/api/values');
        this.setState({seenIndexes: indexes.data});
    }

    handleSubmit = async(event) => {
        event.preventDefault();
        await axios.post('/api/values', {index: this.state.index});
        this.setState({index: ''});
    };

    renderSeenIndexes() {
        console.log(this.state.seenIndexes);
        return this.state.seenIndexes.map(({number}) => number).join(' ,');
    }

    renderValues() {
        const enteries = [];

        for(let key in this.state.values) {
            enteries.push(
                <div key={key}>
                    For index {key} I calculated {this.state.values[key]}
                </div>
            );
        };

        return enteries;
    }

    render() {
        return (
            <div>
                <form onSubmit={this.handleSubmit}>
                    <label>Enter your index:</label>
                    <input
                        value={this.state.index}
                        onChange={event => this.setState({index: event.target.value})}
                    />
                    <button>Submit</button>
                </form>

                <h3>Indexes I have seen:</h3>
                {this.renderSeenIndexes()}

                <h3>Calculated values:</h3>
                {this.renderValues()}
            </div>
        );
    }
};

export default Fib;
