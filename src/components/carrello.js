import { Component } from 'react';
import CardCarrello from './cardcarrello';

class Carrello extends Component {

    carrello = {
        qcar: [
          {Id_Utente: 1, Id_Prodotto: 0,quantità: 0, nome: "", nvol: 0,src_image: "",prezzo : ""},
        ]
    }

    carrelloempty = {state : "true"};

    componentDidMount() {
        var idutente = {"Id_Utente": this.props.utente.Id_Utente};

        fetch('http://127.0.0.1:5555/ottieniCarrello', {
            method: 'POST',
            body: JSON.stringify(idutente),
            headers: {
                'Content-type': 'application/json; charset=UTF-8',
            },
        })
        .then(res => res.json())
        .then((data) => {
            //alert(data[0].Id_Utente);
            if(data[0].Id_Utente === "-1"){
                //alert("nessun articolo nel carrello");
                this.carrelloempty.state = "true";
                const carrelloempty = this.carrelloempty;
                this.setState({carrelloempty});
            }
            else {
                this.carrello.qcar = data;
                const carrello = this.carrello;
                this.carrelloempty.state = "false";
                const carrelloempty = this.carrelloempty;
                this.setState({carrelloempty});
                this.setState({carrello});
            }
        })
        .catch((err) => {
            console.log(err.message);
        });

    }

    reload = {set: 0};

    handleRemove = qcar1 => {
        var DeleteCarrello = {"Id_Utente": qcar1.Id_Utente, "Id_Prodotto": qcar1.Id_Prodotto};
        //alert(qcar1.Id_Prodotto);
        fetch('http://127.0.0.1:5555/deleteProdottoCarrello', {
            method: 'POST',
            body: JSON.stringify(DeleteCarrello),
            headers: {
                'Content-type': 'application/json; charset=UTF-8',
            },
        })
        .then(res => res.json())
        .then((data) => {
            if(data[0].state === "false"){
                //Articolo NON aggiunto perchè non c'è la quantità disponibile nel magazzino
            }
        })
        .catch((err) => {
            console.log(err.message);
        });
        this.componentDidMount();
    }

    handleAddQuantità =(qcar1,value) =>{
        var aggiungialCarrello = {"Id_Utente": qcar1.Id_Utente, "Id_Prodotto": qcar1.Id_Prodotto,"sign": ""};
        var update = "false";

        if(value === "up"){
            if(qcar1.quantità !== 10){
                qcar1.quantità++;
                aggiungialCarrello.sign = "+";
                update = "true";
            }
        } 
        else{
            if(qcar1.quantità !== 1){
                qcar1.quantità--;
                aggiungialCarrello.sign = "-";
                update = "true";
            }
        }
        if(update === "true"){
            fetch('http://127.0.0.1:5555/aggiungialCarrello', {
                method: 'POST',
                body: JSON.stringify(aggiungialCarrello),
                headers: {
                    'Content-type': 'application/json; charset=UTF-8',
                },
            })
            .then(res => res.json())
            .then((data) => {
                if(data[0].state === "false"){
                    //Prodotto esaurito nel magazzino
                }
            })
            .catch((err) => {
                console.log(err.message);
            });

        const qcar = this.carrello.qcar.filter(qcarv => qcarv.Id_Prodotto === qcar1.Id_Prodotto);
        this.setState({qcar});
        }
       
    }
   
    render(){
        switch(this.props.utente.Id_Utente){
            case -1:{
                return(
                    <>
                        <h3>Per visualizzare il carrello bisogna accedere</h3>
                    </>
                );
                
            }

            default :{
                if(this.carrelloempty.state === "true"){
                    return(
                        <>
                            <h3>Il carrello è vuoto</h3>
                        </>
                    );
                }
                else{
                    return(
                        <>
                            <div className='container'>
                                <div className="row">
                                    <div className='col-8'>
                                        {this.carrello.qcar.map(qcar => (
                                            <CardCarrello 
                                            key={qcar.Id_Prodotto}
                                            qcar={qcar}
                                            OnAddQuantità={this.handleAddQuantità}
                                            onRemove={this.handleRemove}
                                            />
                                        ))}
                                        <hr />
                                    </div>
                                    <div className='col-4'>
                                        <div className="card" style={{"width": "18rem"}}>
                                            <div className="card-body">
                                                <h5 className="card-title">Nel Carrello</h5>
                                                <hr />
                                                <p className="card-text">
                                                    {this.carrello.qcar.map(qcar => qcar.quantità).reduce((prev,curr) => prev + curr, 0)} articoli
                                                </p>
                                                <p className="card-text">
                                                    Totale: {this.carrello.qcar.map(qcar => Math.round((qcar.quantità * qcar.prezzo) * 100) / 100).reduce((prev,curr) => prev + curr, 0)}€
                                                    </p>
                                                <div className="d-grid gap-2">
                                                    <button onClick={() => this.props.OnGoToCheckout()} className="btn btn-info  m-2">
                                                        Procedi con il Checkout
                                                    </button>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        
                        </>
                    );

                }
                
            }
        }

        
    }
}


export default Carrello;