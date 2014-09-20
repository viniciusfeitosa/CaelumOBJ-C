//
//  FormularioContatoViewController.h
//  ContatosIP67
//
//  Created by ios4548 on 30/08/14.
//  Copyright (c) 2014 ios4548. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"
#import "ListaContatosProtocol.h"

@interface FormularioContatoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *telefone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *endereco;
@property (weak, nonatomic) IBOutlet UITextField *site;
@property (weak) id<ListaContatosProtocol> delegate;
@property (strong) NSMutableArray *contatos;

@property (strong) Contato *contato;

- (id)initWithContato:(Contato *)umContato;

- (IBAction)proximoElemento:(UITextField *)textField;


@end
