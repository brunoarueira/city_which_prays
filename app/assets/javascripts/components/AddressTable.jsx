class AddressTable extends React.Component {
  constructor (props) {
    super(props);

    this.state = {
      addresses: []
    }

    this.handleTableLineClick = this.handleTableLineClick.bind(this);
  }

  handleTableLineClick (address) {
    this.props.setAddress(address);
  }

  table () {
    var tableItems = this.props.addresses.map(function (address, i) {
      return (
        <tr key={i} onClick={() => this.handleTableLineClick(address) }>
          <td>{address.address}</td>
          <td>{address.neighborhood}</td>
          <td>{address.city} - {address.state}</td>
          <td>{address.zipcode}</td>
        </tr>
      );
    }.bind(this));

    return (
      <div className="table-responsive">
        <table className="table table-striped table-hover">
          <thead>
            <tr>
              <th>Logradouro/Nome</th>
              <th>Bairro</th>
              <th>Localidade/UF</th>
              <th>CEP</th>
            </tr>
          </thead>

          <tbody>
            {tableItems}
          </tbody>
        </table>
      </div>
    );
  }

  render () {
    return (
      <div className="col-md-12">
        <h3 className="page-header"><span className="bolder">Endereços</span> Encontrados</h3>

        {this.table()}
      </div>
    );
  }
}
