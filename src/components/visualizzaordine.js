import { Component } from 'react';
import CardVisualizzaOrdine from './cardvisualizzaordine';


class VisualizzaOrdine extends Component{

    ordine = {
        prodotti: [
          //{Id_Utente: 1, Id_Prodotto: 0,quantità: 0, nome: "", nvol: 0,src_image: "",prezzo : ""},
        ]
    }


    componentDidMount() {
        var getAcquisti = {"Id_Acquisto" : this.props.ordineacquisto.Id_Acquisto};
            fetch('http://127.0.0.1:5555/getProdottiOrdine', {
                method: 'POST',
                body: JSON.stringify(getAcquisti),
                headers: {
                    'Content-type': 'application/json; charset=UTF-8',
                },
            })
            .then(res => res.json())
            .then((data) => {
                if(data[0].Id_Acquisto !== "-1"){
                    this.ordine.prodotti = data;
                    const ordine = this.ordine;
                    this.setState({ordine});
                }
            })
            .catch((err) => {
                console.log(err.message);
            });

    }
 

    render(){
        return(
            <>
                <div className="container">
                    <button onClick={() => this.props.OnGoToOrdini(this.props.admin)} className='btn btn-primary'>
                        Indietro
                    </button>
                    {this.ordine.prodotti.map(prodotti => (
                        <CardVisualizzaOrdine 
                        key={prodotti.Id_Prodotto}
                        prodotti={prodotti}/>
                    ))}
                    <hr />
                </div>
            
            
            </>
        );
    }
}


export default VisualizzaOrdine;