import { Component } from 'react';
import $ from 'jquery';

class Registrazione extends Component {

    render(){
        return(

            <>
                <div className='container' style={{"width": "38rem"}}>
                    <div className='col'> 
                        <div className="mb-3">
                            <label htmlFor="exampleInputNome1" className="form-label">Nome</label>
                            <input type="text" className="form-control" id="nome" aria-describedby="nomeHelp"/>
                            <div className="alert alert-danger" style={{visibility : this.props.alertaccesso.visnome}} role="alert" >
                                Non lasciare il campo vuoto.
                            </div>
                        </div>
                    </div>
                    <div className='col'> 
                        <div className="mb-3">
                            <label htmlFor="exampleInputCognome1" className="form-label">Cognome</label>
                            <input type="text" className="form-control" id="cognome" aria-describedby="cognomeHelp"/>
                            <div className="alert alert-danger" style={{visibility : this.props.alertaccesso.viscognome}} role="alert" >
                                Non lasciare il campo vuoto.
                            </div> 
                        </div>
                    </div>
                    <div className='col'> 
                        <div className="mb-3">
                            <label htmlFor="exampleInputEmail1" className="form-label">Email address</label>
                            <input type="email" className="form-control" id="email" aria-describedby="emailHelp"/>
                            <div id="emailHelp" className="form-text">Non condivideremo mai la tua email con nessun altro.</div>
                            <div className="alert alert-danger" style={{visibility : this.props.alertaccesso.visemail}} role="alert" >
                                Inserire una email valida.
                            </div>
                        </div>
                    </div>
                    <div className='col'> 
                        <div className="mb-3">
                            <label htmlFor="exampleInputPassword1" className="form-label">Password</label>
                            <input type="password" className="form-control" id="passwd"/>
                            <div className="alert alert-danger" style={{visibility : this.props.alertaccesso.vispasswd}} role="alert">
                                Inserire una password di almeno 8 caratteri, una maiuscola ed un numero.
                            </div>
                        </div>
                    </div>
                    <button onClick={() => this.props.OnRegister($('#nome').val(),$('#cognome').val(),$('#email').val(),$('#passwd').val())} className="btn btn-primary">Registrati</button>
                    <button onClick={() => this.props.OnGoToAccesso()}className="btn btn-link">Accedi</button>
                </div>


            </>

        );
    }
}

export default Registrazione;