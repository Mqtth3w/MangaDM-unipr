import { Component } from 'react';
import CardAcquisto from './cardacquisto';

class Ordini extends Component {

    acquisto = {
        ordini : [
            //{Id_Acquisto : 1, qtot: 34, dataacquisto: "2023-03-11", ptot: 33.0},
        ]
    }

    visualizza = "true";


    componentDidMount() {
        if(this.props.admin === 1){
            fetch('http://127.0.0.1:5555/acquisti/:getAll', {
                method: 'GET',
                headers: {
                    'Content-type': 'application/json; charset=UTF-8',
                },
            })
            .then(res => res.json())
            .then((data) => {
                if(data[0].Id_Acquisto === "-1"){
                    this.visualizza = "false";
                    const visualizza = this.visualizza;
                    this.setState({visualizza});
                }
                else{
                    this.acquisto.ordini = data;
                    const acquisto = this.acquisto;
                    this.setState({acquisto});
                }
            })
            .catch((err) => {
                console.log(err.message);
            });

        }
        else{
            
            var getOrdini = {"Id_Utente" : this.props.utente.Id_Utente};
            fetch('http://127.0.0.1:5555/getOrdini', {
                method: 'POST',
                body: JSON.stringify(getOrdini),
                headers: {
                    'Content-type': 'application/json; charset=UTF-8',
                },
            })
            .then(res => res.json())
            .then((data) => {
                if(data[0].Id_Acquisto === "-1"){
                    this.visualizza = "false";
                    const visualizza = this.visualizza;
                    this.setState({visualizza});
                }
                else{
                    this.acquisto.ordini = data;
                    const acquisto = this.acquisto;
                    this.setState({acquisto});
                }
            }) 
            .catch((err) => {
                console.log(err.message);
            });

        }
    }

    render(){
        if(this.visualizza === "true"){
            return(

                <>
                    <div className='container'>
                        {this.acquisto.ordini.map(ordini => (
                            <CardAcquisto 
                            key={ordini.Id_Acquisto}
                            ordini={ordini}
                            OnGoToVisualizzaOrdine={this.props.OnGoToVisualizzaOrdine}/>
                        ))}
                    </div>
                
                </>
            );
        }
        return(
            <h3>Non ci sono ordini</h3>
        );
        
    }
}

export default Ordini;