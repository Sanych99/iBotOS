#include "IBotMsgInterface.h"


class TestMessage: public IBotMsgInterface {
public:
  std::string text;
  
  TesMsg(matchable_ptr message_elements) {   
    message_elements->match(make_e_tuple(e_string(&text)));
    cout<<"TesMsg text: " + text<<"\n\r";
  }
  
  TestMessage() {
    text = "empty";
    cout<<"TesMsg"<<"\n\r";
  }
  
  std::string str(" ");
  int_ lg(1);
  int_ integ(1);
  float_ fl(1.0);
  bool bl(true);
  
  virtual void send_mesasge(mailbox_ptr mbox, std::string publisherCoreNode, std::string coreNodeName, 
		    std::string currentNode, std::string otpMboxNameAsync, std::string topicName) const {
    mbox->send(publisherCoreNode, coreNodeName, 
    make_e_tuple(atom("broadcast"), atom(otpMboxNameAsync), 
    atom(currentNode), atom(topicName), make_e_tuple(e_string("from test message atom!"))
  ));
  }
  
  
  virtual void send_service_response(mailbox_ptr mbox, std::string service_core_node,  
    std::string core_node_name, std::string response_service_message, std::string service_method_name, 
    std::string client_mail_box_name, std::string client_node_full_name, std::string client_method_name_callback, matchable_ptr request_message_from_client) const {
      
    e_tuple<boost::fusion::tuple<atom> > test_tuple = make_e_tuple(atom("test atom from new tuple!"));
      
    mbox->send(service_core_node, core_node_name, make_e_tuple(atom(response_service_message), e_string(service_method_name), atom(client_mail_box_name), 
	      atom(client_node_full_name), e_string(client_method_name_callback), test_tuple, 
	      make_e_tuple(e_string("from test message atom SERVICE!"))));
  }
};