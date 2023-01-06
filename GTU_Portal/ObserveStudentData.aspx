﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="ObserveStudentData.aspx.cs" Inherits="GTU_Portal.WebForm19" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<script runat="server">


</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>Events</h1>
            <ol class="breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>College Event</a></li>
                <li><a href="ObserveGame.aspx">Observe Event</a></li>
                <li class="active">Student Data</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <section class="col-lg-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Student Information</h3>
                            <div class="box-tools pull-right">
                                <asp:Button CssClass="btn btn-primary btn-sm" Text="Export as PDF" runat="server" OnClick="Pdf_Click"></asp:Button>
                            </div>
                        </div>
                        <div id="PDF" runat="server">
                            <div>
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Event Name<span class="m-color-red">*</span></label><br />
                                                <label id="EventName" runat="server" style="font-weight: 500"></label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Game Name<span class="m-color-red">*</span></label><br />
                                                <label id="GameName" runat="server" style="font-weight: 500"></label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Game Date<span class="m-color-red">*</span></label><br />
                                                <label id="GameDate" runat="server" style="font-weight: 500"></label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Event Type<span class="m-color-red">*</span></label><br />
                                                <label id="EventType" runat="server" style="font-weight: 500"></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Egas_id" ShowHeaderWhenEmpty="True" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting">
                                <Columns>
                                    <asp:BoundField DataField="Team_id" HeaderText="Team id" SortExpression="Team_id" />
                                    <asp:BoundField DataField="Student_id" HeaderText="Student id" SortExpression="Student_id" />
                                    <asp:BoundField DataField="Student_name" HeaderText="student name" SortExpression="student_name" />
                                    <asp:BoundField DataField="Student_mobile" HeaderText="student mobile" SortExpression="student_mobile" />
                                    <asp:BoundField DataField="Student_email" HeaderText="student email" SortExpression="student_email" />
                                    <asp:BoundField DataField="C_name" HeaderText="Student college" SortExpression="Student_college" />
                                    <asp:BoundField DataField="Participant_Level" HeaderText="Participant Level" SortExpression="Participant Level" />
                                    <asp:TemplateField HeaderText="Operations">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="delete" ImageUrl="~/Image/delete1.png" Width="20" Height="20" CommandArgument='<%#Eval("Team_id") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:Button ID="enable" CommandName="enable" CssClass="btn btn-primary" BackColor="Green"  Text="Enable Participant" runat="server"  CommandArgument='<%#Eval("Egas_id") %>'/> 
                                            <asp:Button ID="disable" CommandName="disable" CssClass="btn btn-primary" BackColor="Red"  Text="Disable Participant" runat="server"  CommandArgument='<%#Eval("Egas_id") %>'/> 
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                <RowStyle ForeColor="#000066" />
                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                            </asp:GridView>


                            <div style="float: right">
                                <asp:Panel ID="Panel6" ScrollBars="Auto" runat="server" CssClass="modalPopup" Style="display: none; border: 5px solid gray; background-color: white" Width="50%" Height="550px">
                                    <asp:Button ID="Button26" runat="server" Text="Cancel" />
                                    <asp:Button ID="Button3" runat="server" Text="Print" OnClick="Button3_Click" />
                                    <div class="uk-width-medium-1-1" id="Print" runat="server">
                                        <asp:Label ID="lblCollegeId" runat="server" Visible="false" Text="Label"></asp:Label>
                                        <div>
                                            <div class="box-body">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label>Event Name<span class="m-color-red">: </span></label>
                                                            <label id="Label1" runat="server" style="font-weight: 500"></label>
                                                        </div>
                                                    </div>
                                                    <br /><br />
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label>Game Name<span class="m-color-red">: </span></label>
                                                            <label id="Label2" runat="server" style="font-weight: 500"></label>
                                                        </div>
                                                    </div>
                                                    <br /><br />
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label>Game Date<span class="m-color-red">: </span></label>
                                                            <label id="Label3" runat="server" style="font-weight: 500"></label>
                                                        </div>
                                                    </div>
                                                    <br /><br />
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label>Event Type<span class="m-color-red">: </span></label>
                                                            <label id="Label4" runat="server" style="font-weight: 500"></label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br /><br />
                                        <asp:GridView ID="GridView2" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Egas_id" ShowHeaderWhenEmpty="True" OnDataBound="GridView2_DataBound">
                                            <Columns>
                                                <asp:BoundField DataField="Team_id" HeaderText="Team id" SortExpression="Team_id" />
                                                <asp:BoundField DataField="Student_id" HeaderText="Student id" SortExpression="Student_id" />
                                                <asp:BoundField DataField="Student_name" HeaderText="student name" SortExpression="student_name" />
                                                <asp:BoundField DataField="Student_mobile" HeaderText="student mobile" SortExpression="student_mobile" />
                                                <asp:BoundField DataField="Participant_Level" HeaderText="Participant Level" SortExpression="Participant Level" />
                                                <asp:BoundField DataField="Student_email" HeaderText="student email" SortExpression="student_email" />
                                                <asp:BoundField DataField="C_name" HeaderText="Student college" SortExpression="Student_college" />
                                            </Columns>
                                            <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                                            <FooterStyle BackColor="White" ForeColor="#000066" />
                                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                            <RowStyle ForeColor="#000066" />
                                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="select ev.Event_name, game.Game_name, egd.Game_date,egd.Gender from Event_Game_Detail egd join Event ev on ev.Event_id = egd.Event_id join GAME_MAST game on game.Game_id = egd.Game_id WHERE ([Gender] = @Gender)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="1" Name="Gender" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </asp:Panel>
                                <asp:LinkButton ID="LinkButton15" runat="server"></asp:LinkButton>
                                <cc1:ModalPopupExtender ID="ModalPopupExtender10" runat="server"
                                    PopupControlID="Panel6" TargetControlID="LinkButton15"
                                    BackgroundCssClass="modalBackground">
                                </cc1:ModalPopupExtender>

                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </section>
    </div>

</asp:Content>
