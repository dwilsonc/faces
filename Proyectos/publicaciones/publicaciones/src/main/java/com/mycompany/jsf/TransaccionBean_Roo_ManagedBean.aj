// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mycompany.jsf;

import com.mycompany.domain.Publicacion;
import com.mycompany.domain.Transaccion;
import com.mycompany.domain.Usuario;
import com.mycompany.jsf.TransaccionBean;
import com.mycompany.jsf.converter.PublicacionConverter;
import com.mycompany.jsf.converter.UsuarioConverter;
import com.mycompany.service.PublicacionService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import javax.faces.convert.DateTimeConverter;
import javax.faces.validator.LengthValidator;
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.calendar.Calendar;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.inputtextarea.InputTextarea;
import org.primefaces.component.message.Message;
import org.primefaces.component.spinner.Spinner;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect TransaccionBean_Roo_ManagedBean {
    
    declare @type: TransaccionBean: @ManagedBean(name = "transaccionBean");
    
    declare @type: TransaccionBean: @SessionScoped;
    
    @Autowired
    PublicacionService TransaccionBean.publicacionService;
    
    private String TransaccionBean.name = "Transaccions";
    
    private Transaccion TransaccionBean.transaccion;
    
    private List<Transaccion> TransaccionBean.allTransaccions;
    
    private boolean TransaccionBean.dataVisible = false;
    
    private List<String> TransaccionBean.columns;
    
    private HtmlPanelGrid TransaccionBean.createPanelGrid;
    
    private HtmlPanelGrid TransaccionBean.editPanelGrid;
    
    private HtmlPanelGrid TransaccionBean.viewPanelGrid;
    
    private boolean TransaccionBean.createDialogVisible = false;
    
    @PostConstruct
    public void TransaccionBean.init() {
        columns = new ArrayList<String>();
        columns.add("cantidad");
        columns.add("comentario");
        columns.add("fechaRegistro");
    }
    
    public String TransaccionBean.getName() {
        return name;
    }
    
    public List<String> TransaccionBean.getColumns() {
        return columns;
    }
    
    public List<Transaccion> TransaccionBean.getAllTransaccions() {
        return allTransaccions;
    }
    
    public void TransaccionBean.setAllTransaccions(List<Transaccion> allTransaccions) {
        this.allTransaccions = allTransaccions;
    }
    
    public String TransaccionBean.findAllTransaccions() {
        allTransaccions = Transaccion.findAllTransaccions();
        dataVisible = !allTransaccions.isEmpty();
        return null;
    }
    
    public boolean TransaccionBean.isDataVisible() {
        return dataVisible;
    }
    
    public void TransaccionBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid TransaccionBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void TransaccionBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid TransaccionBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void TransaccionBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid TransaccionBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void TransaccionBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid TransaccionBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText usuarioCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        usuarioCreateOutput.setId("usuarioCreateOutput");
        usuarioCreateOutput.setValue("Usuario:   ");
        htmlPanelGrid.getChildren().add(usuarioCreateOutput);
        
        AutoComplete usuarioCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        usuarioCreateInput.setId("usuarioCreateInput");
        usuarioCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{transaccionBean.transaccion.usuario}", Usuario.class));
        usuarioCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{transaccionBean.completeUsuario}", List.class, new Class[] { String.class }));
        usuarioCreateInput.setDropdown(true);
        usuarioCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "usuario", String.class));
        usuarioCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{usuario.nombres} #{usuario.apellidoPaterno} #{usuario.apellidoMaterno} #{usuario.sexo}", String.class));
        usuarioCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{usuario}", Usuario.class));
        usuarioCreateInput.setConverter(new UsuarioConverter());
        usuarioCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(usuarioCreateInput);
        
        Message usuarioCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        usuarioCreateInputMessage.setId("usuarioCreateInputMessage");
        usuarioCreateInputMessage.setFor("usuarioCreateInput");
        usuarioCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(usuarioCreateInputMessage);
        
        HtmlOutputText publicacionCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        publicacionCreateOutput.setId("publicacionCreateOutput");
        publicacionCreateOutput.setValue("Publicacion:   ");
        htmlPanelGrid.getChildren().add(publicacionCreateOutput);
        
        AutoComplete publicacionCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        publicacionCreateInput.setId("publicacionCreateInput");
        publicacionCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{transaccionBean.transaccion.publicacion}", Publicacion.class));
        publicacionCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{transaccionBean.completePublicacion}", List.class, new Class[] { String.class }));
        publicacionCreateInput.setDropdown(true);
        publicacionCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "publicacion", String.class));
        publicacionCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{publicacion.titulo} #{publicacion.descripcion} #{publicacion.tipo} #{publicacion.cantidad}", String.class));
        publicacionCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{publicacion}", Publicacion.class));
        publicacionCreateInput.setConverter(new PublicacionConverter());
        publicacionCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(publicacionCreateInput);
        
        Message publicacionCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        publicacionCreateInputMessage.setId("publicacionCreateInputMessage");
        publicacionCreateInputMessage.setFor("publicacionCreateInput");
        publicacionCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(publicacionCreateInputMessage);
        
        HtmlOutputText cantidadCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        cantidadCreateOutput.setId("cantidadCreateOutput");
        cantidadCreateOutput.setValue("Cantidad: * ");
        htmlPanelGrid.getChildren().add(cantidadCreateOutput);
        
        Spinner cantidadCreateInput = (Spinner) application.createComponent(Spinner.COMPONENT_TYPE);
        cantidadCreateInput.setId("cantidadCreateInput");
        cantidadCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{transaccionBean.transaccion.cantidad}", Integer.class));
        cantidadCreateInput.setRequired(true);
        
        htmlPanelGrid.getChildren().add(cantidadCreateInput);
        
        Message cantidadCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        cantidadCreateInputMessage.setId("cantidadCreateInputMessage");
        cantidadCreateInputMessage.setFor("cantidadCreateInput");
        cantidadCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(cantidadCreateInputMessage);
        
        HtmlOutputText comentarioCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        comentarioCreateOutput.setId("comentarioCreateOutput");
        comentarioCreateOutput.setValue("Comentario: * ");
        htmlPanelGrid.getChildren().add(comentarioCreateOutput);
        
        InputTextarea comentarioCreateInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        comentarioCreateInput.setId("comentarioCreateInput");
        comentarioCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{transaccionBean.transaccion.comentario}", String.class));
        LengthValidator comentarioCreateInputValidator = new LengthValidator();
        comentarioCreateInputValidator.setMaximum(100);
        comentarioCreateInput.addValidator(comentarioCreateInputValidator);
        comentarioCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(comentarioCreateInput);
        
        Message comentarioCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        comentarioCreateInputMessage.setId("comentarioCreateInputMessage");
        comentarioCreateInputMessage.setFor("comentarioCreateInput");
        comentarioCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(comentarioCreateInputMessage);
        
        HtmlOutputText fechaRegistroCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        fechaRegistroCreateOutput.setId("fechaRegistroCreateOutput");
        fechaRegistroCreateOutput.setValue("Fecha Registro: * ");
        htmlPanelGrid.getChildren().add(fechaRegistroCreateOutput);
        
        Calendar fechaRegistroCreateInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        fechaRegistroCreateInput.setId("fechaRegistroCreateInput");
        fechaRegistroCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{transaccionBean.transaccion.fechaRegistro}", Date.class));
        fechaRegistroCreateInput.setNavigator(true);
        fechaRegistroCreateInput.setEffect("slideDown");
        fechaRegistroCreateInput.setPattern("dd/MM/yyyy");
        fechaRegistroCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(fechaRegistroCreateInput);
        
        Message fechaRegistroCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        fechaRegistroCreateInputMessage.setId("fechaRegistroCreateInputMessage");
        fechaRegistroCreateInputMessage.setFor("fechaRegistroCreateInput");
        fechaRegistroCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(fechaRegistroCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid TransaccionBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText usuarioEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        usuarioEditOutput.setId("usuarioEditOutput");
        usuarioEditOutput.setValue("Usuario:   ");
        htmlPanelGrid.getChildren().add(usuarioEditOutput);
        
        AutoComplete usuarioEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        usuarioEditInput.setId("usuarioEditInput");
        usuarioEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{transaccionBean.transaccion.usuario}", Usuario.class));
        usuarioEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{transaccionBean.completeUsuario}", List.class, new Class[] { String.class }));
        usuarioEditInput.setDropdown(true);
        usuarioEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "usuario", String.class));
        usuarioEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{usuario.nombres} #{usuario.apellidoPaterno} #{usuario.apellidoMaterno} #{usuario.sexo}", String.class));
        usuarioEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{usuario}", Usuario.class));
        usuarioEditInput.setConverter(new UsuarioConverter());
        usuarioEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(usuarioEditInput);
        
        Message usuarioEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        usuarioEditInputMessage.setId("usuarioEditInputMessage");
        usuarioEditInputMessage.setFor("usuarioEditInput");
        usuarioEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(usuarioEditInputMessage);
        
        HtmlOutputText publicacionEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        publicacionEditOutput.setId("publicacionEditOutput");
        publicacionEditOutput.setValue("Publicacion:   ");
        htmlPanelGrid.getChildren().add(publicacionEditOutput);
        
        AutoComplete publicacionEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        publicacionEditInput.setId("publicacionEditInput");
        publicacionEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{transaccionBean.transaccion.publicacion}", Publicacion.class));
        publicacionEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{transaccionBean.completePublicacion}", List.class, new Class[] { String.class }));
        publicacionEditInput.setDropdown(true);
        publicacionEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "publicacion", String.class));
        publicacionEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{publicacion.titulo} #{publicacion.descripcion} #{publicacion.tipo} #{publicacion.cantidad}", String.class));
        publicacionEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{publicacion}", Publicacion.class));
        publicacionEditInput.setConverter(new PublicacionConverter());
        publicacionEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(publicacionEditInput);
        
        Message publicacionEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        publicacionEditInputMessage.setId("publicacionEditInputMessage");
        publicacionEditInputMessage.setFor("publicacionEditInput");
        publicacionEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(publicacionEditInputMessage);
        
        HtmlOutputText cantidadEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        cantidadEditOutput.setId("cantidadEditOutput");
        cantidadEditOutput.setValue("Cantidad: * ");
        htmlPanelGrid.getChildren().add(cantidadEditOutput);
        
        Spinner cantidadEditInput = (Spinner) application.createComponent(Spinner.COMPONENT_TYPE);
        cantidadEditInput.setId("cantidadEditInput");
        cantidadEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{transaccionBean.transaccion.cantidad}", Integer.class));
        cantidadEditInput.setRequired(true);
        
        htmlPanelGrid.getChildren().add(cantidadEditInput);
        
        Message cantidadEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        cantidadEditInputMessage.setId("cantidadEditInputMessage");
        cantidadEditInputMessage.setFor("cantidadEditInput");
        cantidadEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(cantidadEditInputMessage);
        
        HtmlOutputText comentarioEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        comentarioEditOutput.setId("comentarioEditOutput");
        comentarioEditOutput.setValue("Comentario: * ");
        htmlPanelGrid.getChildren().add(comentarioEditOutput);
        
        InputTextarea comentarioEditInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        comentarioEditInput.setId("comentarioEditInput");
        comentarioEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{transaccionBean.transaccion.comentario}", String.class));
        LengthValidator comentarioEditInputValidator = new LengthValidator();
        comentarioEditInputValidator.setMaximum(100);
        comentarioEditInput.addValidator(comentarioEditInputValidator);
        comentarioEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(comentarioEditInput);
        
        Message comentarioEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        comentarioEditInputMessage.setId("comentarioEditInputMessage");
        comentarioEditInputMessage.setFor("comentarioEditInput");
        comentarioEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(comentarioEditInputMessage);
        
        HtmlOutputText fechaRegistroEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        fechaRegistroEditOutput.setId("fechaRegistroEditOutput");
        fechaRegistroEditOutput.setValue("Fecha Registro: * ");
        htmlPanelGrid.getChildren().add(fechaRegistroEditOutput);
        
        Calendar fechaRegistroEditInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        fechaRegistroEditInput.setId("fechaRegistroEditInput");
        fechaRegistroEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{transaccionBean.transaccion.fechaRegistro}", Date.class));
        fechaRegistroEditInput.setNavigator(true);
        fechaRegistroEditInput.setEffect("slideDown");
        fechaRegistroEditInput.setPattern("dd/MM/yyyy");
        fechaRegistroEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(fechaRegistroEditInput);
        
        Message fechaRegistroEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        fechaRegistroEditInputMessage.setId("fechaRegistroEditInputMessage");
        fechaRegistroEditInputMessage.setFor("fechaRegistroEditInput");
        fechaRegistroEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(fechaRegistroEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid TransaccionBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText usuarioLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        usuarioLabel.setId("usuarioLabel");
        usuarioLabel.setValue("Usuario:   ");
        htmlPanelGrid.getChildren().add(usuarioLabel);
        
        HtmlOutputText usuarioValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        usuarioValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{transaccionBean.transaccion.usuario}", Usuario.class));
        usuarioValue.setConverter(new UsuarioConverter());
        htmlPanelGrid.getChildren().add(usuarioValue);
        
        HtmlOutputText publicacionLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        publicacionLabel.setId("publicacionLabel");
        publicacionLabel.setValue("Publicacion:   ");
        htmlPanelGrid.getChildren().add(publicacionLabel);
        
        HtmlOutputText publicacionValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        publicacionValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{transaccionBean.transaccion.publicacion}", Publicacion.class));
        publicacionValue.setConverter(new PublicacionConverter());
        htmlPanelGrid.getChildren().add(publicacionValue);
        
        HtmlOutputText cantidadLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        cantidadLabel.setId("cantidadLabel");
        cantidadLabel.setValue("Cantidad:   ");
        htmlPanelGrid.getChildren().add(cantidadLabel);
        
        HtmlOutputText cantidadValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        cantidadValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{transaccionBean.transaccion.cantidad}", String.class));
        htmlPanelGrid.getChildren().add(cantidadValue);
        
        HtmlOutputText comentarioLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        comentarioLabel.setId("comentarioLabel");
        comentarioLabel.setValue("Comentario:   ");
        htmlPanelGrid.getChildren().add(comentarioLabel);
        
        InputTextarea comentarioValue = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        comentarioValue.setId("comentarioValue");
        comentarioValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{transaccionBean.transaccion.comentario}", String.class));
        comentarioValue.setReadonly(true);
        comentarioValue.setDisabled(true);
        htmlPanelGrid.getChildren().add(comentarioValue);
        
        HtmlOutputText fechaRegistroLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        fechaRegistroLabel.setId("fechaRegistroLabel");
        fechaRegistroLabel.setValue("Fecha Registro:   ");
        htmlPanelGrid.getChildren().add(fechaRegistroLabel);
        
        HtmlOutputText fechaRegistroValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        fechaRegistroValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{transaccionBean.transaccion.fechaRegistro}", Date.class));
        DateTimeConverter fechaRegistroValueConverter = (DateTimeConverter) application.createConverter(DateTimeConverter.CONVERTER_ID);
        fechaRegistroValueConverter.setPattern("dd/MM/yyyy");
        fechaRegistroValue.setConverter(fechaRegistroValueConverter);
        htmlPanelGrid.getChildren().add(fechaRegistroValue);
        
        return htmlPanelGrid;
    }
    
    public Transaccion TransaccionBean.getTransaccion() {
        if (transaccion == null) {
            transaccion = new Transaccion();
        }
        return transaccion;
    }
    
    public void TransaccionBean.setTransaccion(Transaccion transaccion) {
        this.transaccion = transaccion;
    }
    
    public List<Usuario> TransaccionBean.completeUsuario(String query) {
        List<Usuario> suggestions = new ArrayList<Usuario>();
        for (Usuario usuario : Usuario.findAllUsuarios()) {
            String usuarioStr = String.valueOf(usuario.getNombres() +  " "  + usuario.getApellidoPaterno() +  " "  + usuario.getApellidoMaterno() +  " "  + usuario.getSexo());
            if (usuarioStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(usuario);
            }
        }
        return suggestions;
    }
    
    public List<Publicacion> TransaccionBean.completePublicacion(String query) {
        List<Publicacion> suggestions = new ArrayList<Publicacion>();
        for (Publicacion publicacion : publicacionService.findAllPublicacions()) {
            String publicacionStr = String.valueOf(publicacion.getTitulo() +  " "  + publicacion.getDescripcion() +  " "  + publicacion.getTipo() +  " "  + publicacion.getCantidad());
            if (publicacionStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(publicacion);
            }
        }
        return suggestions;
    }
    
    public String TransaccionBean.onEdit() {
        return null;
    }
    
    public boolean TransaccionBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void TransaccionBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String TransaccionBean.displayList() {
        createDialogVisible = false;
        findAllTransaccions();
        return "transaccion";
    }
    
    public String TransaccionBean.displayCreateDialog() {
        transaccion = new Transaccion();
        createDialogVisible = true;
        return "transaccion";
    }
    
    public String TransaccionBean.persist() {
        String message = "";
        if (transaccion.getCodigo() != null) {
            transaccion.merge();
            message = "Successfully updated";
        } else {
            transaccion.persist();
            message = "Successfully created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialog.hide()");
        context.execute("editDialog.hide()");
        
        FacesMessage facesMessage = new FacesMessage(message);
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllTransaccions();
    }
    
    public String TransaccionBean.delete() {
        transaccion.remove();
        FacesMessage facesMessage = new FacesMessage("Successfully deleted");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllTransaccions();
    }
    
    public void TransaccionBean.reset() {
        transaccion = null;
        createDialogVisible = false;
    }
    
    public void TransaccionBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}