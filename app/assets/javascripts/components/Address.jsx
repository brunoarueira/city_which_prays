class Address extends React.Component {
  constructor (props) {
    super(props);

    this.state = {
      addresses: [],
      address: null,
      address_name: '',
      address_number: '',
      address_complement: '',
      address_neighborhood: '',
      address_city: '',
      address_state: '',
      address_zipcode: '',
      searchingAddress: false
    };

    this.handleInputChange = this.handleInputChange.bind(this);
    this.handleSearchClick = this.handleSearchClick.bind(this);
    this.setAddress = this.setAddress.bind(this);
    this.nextButton = this.nextButton.bind(this);
  }

  handleInputChange (e) {
    this.setState({
      [e.target.id]: e.target.value
    });
  }

  handleSearchClick () {
    var value = document.getElementById("zipcode").value;

    $.ajax({
      method: "GET",
      dataType: "json",
      url: APIEndpoints.ZIPCODE,
      data: { value: value },
      beforeSend: (jqXHR) => {
        this.setState({
          searchingAddress: true
        });
      },
      success: (data, textStatus, jqXHR) => {
        if (textStatus === "404") {
          this.setState({ showAddressForm: false });

          return;
        }

        this.setState({
          addresses: data,
          showAddressForm: true
        });
      },
      error: (jqXHR, textStatus) => {
        this.setState({ showAddressForm: false });
      },
      complete: (jqXHR, textStatus) => {
        this.setState({ searchingAddress: false });
      }
    });
  }

  getRadioOrCheckboxValue (el) {
    var values = [];

    if (!el) {
      return null;
    }

    if (typeof el.length == 'undefined') {
      return el.checked ? true : null;
    }

    for (var i = 0; i < el.length; i++) {
      el[i].checked && values.push(el[i].value)
    }

    return values;
  }

  nextButton () {
    var whatsapp = document.querySelector('input[name=whatsapp]:checked'),
        termsToReceive = document.querySelector('input[name=terms]:checked'),
        data = {
          name: this.props.name,
          email: this.props.email,
          cellphone_attributes: {
            ddd: this.props.ddd_cellphone,
            number: this.props.number_cellphone,
            whatsapp: this.getRadioOrCheckboxValue(whatsapp)
          },
          residential_phone_attributes: {
            ddd: this.props.ddd_residential_phone,
            number: this.props.number_residential_phone
          },
          address_attributes: {
            name: this.state.addresses[0].address,
            number: this.state.address_number,
            complement: this.state.address_complement,
            neighborhood: this.state.addresses[0].neighborhood,
            city: this.state.addresses[0].city,
            state: this.state.addresses[0].state,
            zipcode: this.state.addresses[0].zipcode
          },
          terms_to_receive: this.getRadioOrCheckboxValue(termsToReceive)
        };

    return this.props.nextButton(data);
  }

  setAddress (address) {
    this.setState({
      addresses: [address]
    });
  }

  componentWillReceiveProps (props) {
    this.setState({
      addresses: props.addresses,
      isFetching: props.isFetching
    });
  }

  loadSpinner () {
    if (this.state.searchingAddress) {
      return (
        <div className="col-md-12">
          Carregando...
        </div>
      );
    }
  }

  zipcodeForm () {
    return (
      <div className="text-center">
        <span className="featured-2x">Digite seu CEP ou o nome da sua rua</span>

        <div className="row">
          &nbsp;
        </div>

        <div className="row">
          <div className="col-md-7 col-md-offset-2">
            <div className="form-group">
              <input id="zipcode" name="zipcode" className="form-control input-lg" placeholder="Ex.: Avenida 85, 74980-000"/>
            </div>
          </div>

          <div className="col-md-2">
            <button className="btn btn-orange btn-lg" onClick={this.handleSearchClick}>Pesquisar</button>
          </div>

          {this.loadSpinner()}
        </div>
      </div>
    );
  }

  addressForm () {
    const address = this.state.addresses[0];

    return (
      <div className="form center-block">
        <div className="row">
          <div className="row">
            <div className="col-md-12">
              <div className="form-group form-group-lg">
                <label htmlFor="address_name" className="control-label">Logradouro</label>
                <input id="address_name" name="address_name" className="form-control" disabled="disabled" value={address.address} />
              </div>
            </div>
          </div>

          <div className="row">
            <div className="col-md-2">
              <div className="form-group form-group-lg">
                <label htmlFor="address_number" className="control-label">N&uacute;mero</label>
                <input id="address_number" name="address_number" className="form-control" onChange={this.handleInputChange} />
              </div>
            </div>

            <div className="col-md-10">
              <div className="form-group form-group-lg">
                <label htmlFor="address_complement" className="control-label">Complemento</label>
                <input id="address_complement" name="address_complement" className="form-control" onChange={this.handleInputChange} />
              </div>
            </div>
          </div>

          <div className="row">
            <div className="col-md-5">
              <div className="form-group form-group-lg">
                <label htmlFor="address_neighborhood" className="control-label">Bairro</label>
                <input id="address_neighborhood" name="address_neighborhood"
                  className="form-control" disabled="disabled"
                  value={address.neighborhood} />
              </div>
            </div>

            <div className="col-md-5">
              <div className="form-group form-group-lg">
                <label htmlFor="address_city" className="control-label">Cidade</label>
                <input id="address_city" name="address_city" className="form-control" disabled="disabled" value={address.city} />
              </div>
            </div>

            <div className="col-md-2">
              <div className="form-group form-group-lg">
                <label htmlFor="address_state" className="control-label">UF</label>
                <input id="address_state" name="address_state" className="form-control" disabled="disabled" value={address.state} />
              </div>
            </div>
          </div>

          <div className="row">
            <div className="col-md-12">
              <div className="checkbox control-label">
                <label>
                  <input id="terms" name="terms" type="checkbox" onChange={this.handleInputChange} /> Estou ciente que ao cadastrar-me como voluntário(a), minha residência será excetuada como alvo de entrega do presente (uma vez que terei acesso, antecipado, ao presente)
                </label>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }

  showSearchResult () {
    var addressesLength = (this.state.addresses || []).length,
        searchResult;

    if (addressesLength > 1) {
      searchResult = <AddressTable addresses={this.state.addresses} setAddress={this.setAddress} />;
    } else if (addressesLength === 1) {
      searchResult = (
        <div>
          {this.addressForm()}

          <div className="row">
            <div className="form center-block">
              {this.nextButton()}
            </div>
          </div>
        </div>
      );
    } else if (addressesLength === 0) {
      searchResult = '';
    }

    return searchResult;
  }

  render () {
    return (
      <div className="row">
        <div className="form center-block">
          {this.zipcodeForm()}
        </div>

        {this.showSearchResult()}
      </div>
    );
  }
}
