class AttendingChurch extends React.Component {
  constructor (props) {
    super(props);

    this.state = {
      attending_church: 'true',
      church_name: '',
      church_zipcode: '',
      church_address_name: '',
      church_address_number: '',
      church_address_complement: '',
      church_address_neighborhood: '',
      church_address_city: '',
      church_address_state: '',
      church_main_leader: '',
      volunteer: this.props.volunteer
    };

    this.submitRegistration = this.submitRegistration.bind(this);
    this.handleInputChange = this.handleInputChange.bind(this);
  }

  submitRegistration () {
    var data = {
      attending_church_attributes: {
        name: this.state.name,
        main_leader: this.state.church_main_leader,
        address_attributes: {
          name: this.state.church_address_name,
          number: this.state.church_address_number,
          complement: this.state.church_address_complement,
          neighborhood: this.state.church_address_neighborhood,
          city: this.state.church_address_city,
          state: this.state.church_address_state,
          zipcode: this.state.church_zipcode
        }
      }
    }

    return this.props.submitRegistration(Object.assign({}, this.state.volunteer, data));
  }

  handleInputChange (e) {
    this.setState({
      [e.target.id]: e.target.value,
      form_filled: true
    });
  }

  isAttendingChurch () {
    return this.state.attending_church === "true";
  }

  churchForm () {
    var form = '';

    if (this.isAttendingChurch()) {
      form = (
        <div>
          <hr className="custom-hr" />

          <div className="form center-block">
            <div className="row">
              <div className="col-md-12">
                <div className="form-group form-group-lg">
                  <label htmlFor="church_name" className="control-label">Nome da igreja</label>
                  <input id="church_name" name="church_name" className="form-control" onChange={this.handleInputChange} />
                </div>
              </div>

              <div className="col-md-5">
                <div className="form-group form-group-lg">
                  <label htmlFor="church_zipcode" className="control-label">CEP</label>
                  <InputMask id="church_zipcode" name="church_zipcode" mask="99999-999" className="form-control" onChange={this.handleInputChange} />
                </div>
              </div>

              <div className="col-md-7">
                <div className="form-group form-group-lg">
                  <label htmlFor="church_address_name" className="control-label">Logradouro</label>
                  <input id="church_address_name" name="church_address_name" className="form-control" onChange={this.handleInputChange} />
                </div>
              </div>

              <div className="col-md-3">
                <div className="form-group form-group-lg">
                  <label htmlFor="church_address_number" className="control-label">N&uacute;mero</label>
                  <input id="church_address_number" name="church_address_number" className="form-control" onChange={this.handleInputChange} />
                </div>
              </div>

              <div className="col-md-9">
                <div className="form-group form-group-lg">
                  <label htmlFor="church_address_complement" className="control-label">Complemento</label>
                  <input id="church_address_complement" name="church_address_complement" className="form-control" onChange={this.handleInputChange} />
                </div>
              </div>

              <div className="col-md-4">
                <div className="form-group form-group-lg">
                  <label htmlFor="church_address_neighborhood" className="control-label">Bairro</label>
                  <input id="church_address_neighborhood" name="church_address_neighborhood" className="form-control" onChange={this.handleInputChange} />
                </div>
              </div>

              <div className="col-md-6">
                <div className="form-group form-group-lg">
                  <label htmlFor="church_address_city" className="control-label">Cidade</label>
                  <input id="church_address_city" name="church_address_city" className="form-control" onChange={this.handleInputChange} />
                </div>
              </div>

              <div className="col-md-2">
                <div className="form-group form-group-lg">
                  <label htmlFor="church_address_state" className="control-label">UF</label>
                  <input id="church_address_state" name="church_address_state" className="form-control" onChange={this.handleInputChange} />
                </div>
              </div>

              <div className="col-md-12">
                <div className="form-group form-group-lg">
                  <label htmlFor="church_main_leader" className="control-label">Nome do líder principal</label>
                  <input id="church_main_leader" name="church_main_leader" className="form-control" onChange={this.handleInputChange} />
                </div>
              </div>
            </div>
          </div>
        </div>
      );
    }

    return form;
  }

  attendingChurch () {
    return (
      <div>
        <div className="form center-block">
          <div className="row">
            <div className="col-md-12">
              <div className="text-center">
                <span className="featured-2x light-green">Faz parte de alguma igreja?</span>
              </div>

              <div className="row">
                &nbsp;
              </div>

              <div className="form-group form-group-lg text-center">
                <div className="radio-inline">
                  <label htmlFor="attending_church_yes">
                    <input id="attending_church_yes" name="attending_church"
                                                     type="radio"
                                                     value="true"
                                                     onChange={this.handleInputChange}
                                                     checked={this.isAttendingChurch()} />
                    Sim
                  </label>
                </div>

                <div className="radio-inline">
                  <label htmlFor="attending_church_no">
                    <input id="attending_church_no" name="attending_church"
                                                    type="radio"
                                                    value="false"
                                                    onChange={this.handleAttendingChurch}
                                                    checked={!this.isAttendingChurch()} />

                    Não
                  </label>
                </div>
              </div>
            </div>
          </div>
        </div>

        {this.churchForm()}
      </div>
    );
  }

  render () {
    return (
      <div>
        <div className="row bg-light-gray">
          {this.attendingChurch()}
        </div>

        <div className="row">
          <div className="form center-block">
            {this.submitRegistration()}
          </div>
        </div>
      </div>
    );
  }
}
