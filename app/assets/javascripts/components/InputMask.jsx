class InputMask extends React.Component {
  render () {
    let props = this.props;

    return (
      <input ref="masked_field" {...props} />
    );
  }

  handleMaskOnChange (e) {
    this.props.onChange(e, e.target.value);
  }

  componentDidMount () {
    this.setMask();
  }

  setMask () {
    let field = $(ReactDOM.findDOMNode(this.refs.masked_field));

    field.mask(this.props.mask).on('change.masked_input_cmp', this.handleMaskOnChange.bind(this));
  }
}
