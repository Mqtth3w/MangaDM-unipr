import { Component } from 'react';
import $ from 'jquery';

class Accesso extends Component {

//visibility={this.props.alert.visemail === "true" ? "visible" : "hidden"}
//w-25
    render(){
        return(
            <>
                <div className='container' style={{"width": "38rem"}}>
                    <div className='col'> 
                        <div className="mb-3">
                            <div class="form-floating mb-3">
                                <input type="email" id="email" class="form-control" placeholder="" value="donato.bruno@gmail.it"/>
                                <label for="floatingInput">Email address</label>
                            </div>
                            <div id="emailHelp" className="form-text">Non condivideremo mai la tua email con nessun altro.</div>
                            <div className="alert alert-danger" style={{visibility : this.props.alertaccesso.visemail}} role="alert" >
                                Inserire una email valida.
                            </div>
                        </div>
                    </div>
                    <div className='col'> 
                        <div className="mb-3">
                            <label htmlFor="exampleInputPassword1" className="form-label">Password</label>
                            <input type="password" className="form-control" id="passwd" value="Ciaomamma78"/>
                            <div className="alert alert-danger" style={{visibility : this.props.alertaccesso.vispasswd}} role="alert">
                                Inserire una password di almeno 8 caratteri, una maiuscola ed un numero.
                            </div>
                        </div>
                    </div>
                    <button onClick={() => this.props.OnAccesso($('#email').val(),$('#passwd').val())} className="btn btn-primary">Accedi</button>
                    <button onClick={() => this.props.OnRegistrazione()} className="btn btn-link m-2">Registrati</button>
                </div>
            </>
        );
    }
}

export default Accesso;