import { Component } from 'react';
import CardIndirizzi from './cardindirizzi';

class Indirizzi extends Component {
    recapito = {
        rec: [
          //{Id_Recapito: 1, Id_Utente: this.props.utente.Id_Utente, ncivico: 22, via: "Via prova", città: "Parma", provincia: "PR", cap: 43125, telefono: "3313456782", note: "Suonare al primo piano"},
        ]
    }
  
    handleRemoveRecapito = rec => {
        var getRecapito = {"Id_Recapito" : rec.Id_Recapito};
        fetch('http://127.0.0.1:5555/delete/:recapito', {
            method: 'POST',
            body: JSON.stringify(getRecapito),
            headers: {
                'Content-type': 'application/json; charset=UTF-8',
            },
        })
        .then(res => res.json())
        .then((data) => {
            if(data[0].state === "true"){
                this.componentDidMount();
            }
        })
        .catch((err) => {
            console.log(err.message);
        });
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
            }
            else{
                this.recapito.rec = [];
            }
            const recapito = this.recapito;
            this.setState({recapito});
        })
        .catch((err) => {
            console.log(err.message);
        });

    }

    render(){

        return(

            <>
                <div className='container'>
                    <div className='row m-3'>
                        {this.recapito.rec.map(rec => (
                        <CardIndirizzi 
                        key={rec.Id_Recapito}
                        rec={rec}
                        OnRemoveRecapito={this.handleRemoveRecapito}/>
                         ))}
                    </div>
                    <div className='row'>
                        <hr />
                        <button onClick={() => this.props.OnGoToAddRecapito(this.recapito.rec.length)} className="btn btn-info m-3" style={{"width": "20rem"}}>Aggiungi nuovo recapito</button>
                        <div className="form-text">Numero massimo di indirizzi : 3</div>
                    </div>
                    
                </div>
            
            </>
        );
    }
}

export default Indirizzi;