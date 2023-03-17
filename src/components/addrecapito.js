import { Component } from 'react';
import $ from 'jquery';

import ControlRecapito from './controlrecapito';

class AddRecapito extends Component {

    alertrecapito = {"via": "hidden", "ncivico": "hidden","cit":"hidden","pr":"hidden","cap": "hidden","tel": "hidden","note": "hidden",};

    handleAddIndirizzo = (via,ncivico,città,provincia,cap,telefono,note) =>{
       var stop = ControlRecapito(via,ncivico,città,provincia,cap,telefono,note);
       //Via
       if(stop.via === "true") {
        this.alertrecapito.via = "visible";
        const alertrecapito = this.alertrecapito;
        this.setState({alertrecapito});
      } 
      else{
        this.alertrecapito.via = "hidden";
        const alertrecapito = this.alertrecapito;
        this.setState({alertrecapito});
      }
      //ncivico
      if(stop.ncivico === "true") {
        this.alertrecapito.ncivico = "visible";
        const alertrecapito = this.alertrecapito;
        this.setState({alertrecapito});
      }
      else{
        this.alertrecapito.ncivico = "hidden";
        const alertrecapito = this.alertrecapito;
        this.setState({alertrecapito});
      }
      //città
      if(stop.città === "true") {
        this.alertrecapito.cit = "visible";
        const alertrecapito = this.alertrecapito;
        this.setState({alertrecapito});
      }
      else{
        this.alertrecapito.cit = "hidden";
        const alertrecapito = this.alertrecapito;
        this.setState({alertrecapito});
      }
      //provincia
      if(stop.provincia === "true") {
        this.alertrecapito.pr = "visible";
        const alertrecapito = this.alertrecapito;
        this.setState({alertrecapito});
      }
      else{
        this.alertrecapito.pr = "hidden";
        const alertrecapito = this.alertrecapito;
        this.setState({alertrecapito});
      }
      //cap
      if(stop.cap === "true") {
        this.alertrecapito.cap = "visible";
        const alertrecapito = this.alertrecapito;
        this.setState({alertrecapito});
      }
      else{
        this.alertrecapito.cap = "hidden";
        const alertrecapito = this.alertrecapito;
        this.setState({alertrecapito});
      }
      //telefono
      if(stop.telefono === "true") {
        this.alertrecapito.tel = "visible";
        const alertrecapito = this.alertrecapito;
        this.setState({alertrecapito});
      }
      else{
        this.alertrecapito.tel = "hidden";
        const alertrecapito = this.alertrecapito;
        this.setState({alertrecapito});
      }
      //note
      if(stop.note === "true") {
        //this.alertrecapito.note = "visible";
        //const alertrecapito = this.alertrecapito;
        //this.setState({alertrecapito});
        note = "Nessuna nota.";
      } 
      else{
        this.alertrecapito.note = "hidden";
        const alertrecapito = this.alertrecapito;
        this.setState({alertrecapito});
      } 

      if(stop.via !== "true" && stop.ncivico !== "true" && stop.città !== "true" && stop.provincia !== "true" && stop.cap !== "true" && stop.telefono !== "true"){
        var addrecapito = {"Id_Utente": this.props.utente.Id_Utente, "via": via, "ncivico": ncivico, "città": città, "provincia": provincia, "cap": cap, "telefono": telefono, "note": note};
        fetch('http://127.0.0.1:5555/inserisciRecapito', {
            method: 'POST',
            body: JSON.stringify(addrecapito),
            headers: {
                'Content-type': 'application/json; charset=UTF-8',
            },
        })
        .then(res => res.json())
        .then((data) => {
            if(data[0].state === "true"){
                this.props.OnGoToIndirizzi();
            }
        })
        .catch((err) => {
            console.log(err.message);
        });
      }
    }
    render(){

        return(

            <>
               <div className='container' style={{textAlign : "center"}}>
                    <div className='row'>
                        <div className='col'>
                            <div className='row'>
                                <div className='col-8'>
                                    <div className="mb-3">
                                        <label htmlFor="exampleInputNome1" className="form-label">Via </label>
                                        <input type="text" className="form-control" id="via" aria-describedby="nomeHelp"/>
                                        <div className="alert alert-danger" style={{visibility : this.alertrecapito.via}} role="alert" >
                                            Non lasciare il campo vuoto.
                                        </div>
                                    </div>
                                </div>
                                <div className='col-4'>
                                    <div className="mb-3">
                                        <label htmlFor="exampleInputNome1" className="form-label">Numero civico</label>
                                        <input type="text" className="form-control" id="ncivico" aria-describedby="nomeHelp"/>
                                        <div className="alert alert-danger" style={{visibility : this.alertrecapito.ncivico}} role="alert" >
                                            Inserire numero.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className='row'>
                                <p/>
                                <div className="mb-3">
                                    <label htmlFor="exampleInputNome1" className="form-label">Città</label>
                                    <input type="text" className="form-control" id="città" aria-describedby="nomeHelp"/>
                                    <div className="alert alert-danger" style={{visibility : this.alertrecapito.cit}} role="alert" >
                                        Non lasciare il campo vuoto.
                                    </div>
                                </div>
                            </div>
                            <div className='row'>
                                <div className="mb-3">
                                    <label htmlFor="exampleInputNome1" className="form-label">Provincia</label>
                                    <input type="text" className="form-control" id="provincia" aria-describedby="nomeHelp"/>
                                    <div className="alert alert-danger" style={{visibility : this.alertrecapito.pr}} role="alert" >
                                        Inserire la sigla.
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className='col'>
                            <div className='row'>
                                <div className="mb-3">
                                    <label htmlFor="exampleInputNome1" className="form-label">CAP</label>
                                    <input type="text" className="form-control" id="cap" aria-describedby="nomeHelp"/>
                                    <div className="alert alert-danger" style={{visibility : this.alertrecapito.cap}} role="alert" >
                                        Inserire un CAP valido.
                                    </div>
                                </div>
                            </div>
                            <div className='row'>
                                <div className="mb-3">
                                    <label htmlFor="exampleInputNome1" className="form-label">Telefono</label>
                                    <input type="text" className="form-control" id="telefono" aria-describedby="nomeHelp"/>
                                    <div className="alert alert-danger" style={{visibility : this.alertrecapito.tel}} role="alert" >
                                        Inserire un numero valido.
                                    </div>
                                </div>
                            </div>
                            <div className='row'>
                                <div className="mb-3">
                                    <label htmlFor="exampleInputNome1" className="form-label">Note per il corriere</label>
                                    <input type="text" className="form-control" id="note" aria-describedby="nomeHelp"/>
                                    <div className="alert alert-danger" style={{visibility : this.alertrecapito.note}} role="alert" >
                                        Non lasciare il campo vuoto.
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <button onClick={() => this.handleAddIndirizzo($('#via').val(),$('#ncivico').val(),$('#città').val(),$('#provincia').val(),$('#cap').val(),$('#telefono').val(),$('#note').val())} className='btn btn-primary'>
                        Aggiungi indirizzo
                    </button>
               </div> 
            
            </>
        );
    }

}

export default AddRecapito;
