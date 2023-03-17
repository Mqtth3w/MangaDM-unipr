import { Component } from 'react';
import CardCheckout from './cardcheckout';

class Checkout extends Component {

    recapito = {
        rec: [
          //{Id_Recapito: 1, Id_Utente: this.props.utente.Id_Utente, ncivico: 22, via: "Via prova", città: "Parma", provincia: "PR", cap: 43125, telefono: "3313456782", note: "Suonare al primo piano"},
        ]
    }


    componentDidMount() {
        var getRecapito = {"Id_Utente" : this.props.utente.Id_Utente};
        fetch('http://127.0.0.1:5555/recapitoUtente', {
            method: 'POST',
            body: JSON.stringify(getRecapito),
            headers: {
                'Content-type': 'application/json; charset=UTF-8',
            },
        })
        .then(res => res.json())
        .then((data) => {
            if(data[0].Id_Recapito !== "-1"){
                this.recapito.rec = data;
                const recapito = this.recapito;
                this.setState({recapito});
            }
        })
        .catch((err) => {
            console.log(err.message);
        });

    }

    control = "hidden";
 
    handleConfermaOrdine = btn =>{
        if(this.props.Id_Recapito_Effettivo !== -1){
            this.control = "hidden";
            //inserisco l'ordine.
            var Acquisto = {"Id_Utente" : this.props.utente.Id_Utente,"Id_Recapito": this.props.Id_Recapito_Effettivo};
            fetch('http://127.0.0.1:5555/aggiungiAcquisto', {
                method: 'POST',
                body: JSON.stringify(Acquisto),
                headers: {
                    'Content-type': 'application/json; charset=UTF-8',
                },
            })
            .then(res => res.json())
            .then((data) => {
                if(data[0].state === "true"){
                    alert("Ordine Avvenuto con successo!..");
                    this.props.OnGoToCarrello();
                }
                else{
                    alert("Alcuni prodotti non sono disponibili per la quantità desiderata..");
                }
            })
            .catch((err) => {
                console.log(err.message);
            });
        }
        else{
            this.control = "visible";
        }

        const control = this.control;
        this.setState({control});
    }

    render(){


        return(

            <>

                <div className='container'>
                    <div className='row m-3'>
                        {this.recapito.rec.map(rec => (
                        <CardCheckout 
                        key={rec.Id_Recapito}
                        rec={rec}
                        OnRecapitoEffettivo={this.props.OnRecapitoEffettivo}/>
                         ))}
                    </div>
                    <div className='row p-3'>
                        <div className='col'>
                        <button onClick={() => this.handleConfermaOrdine()} className="btn btn-success">Conferma e Acquista</button>
                        <h5 style={{visibility: this.control}}> SELEZIONARE UN INDIRIZZO DI SPEDIZIONE!!</h5>
                        </div>
                        
                    </div>
                </div>
            
            </>
        );
    }
}

export default Checkout;
