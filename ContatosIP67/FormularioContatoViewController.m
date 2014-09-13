//
//  FormularioContatoViewController.m
//  ContatosIP67
//
//  Created by ios4548 on 30/08/14.
//  Copyright (c) 2014 ios4548. All rights reserved.
//

#import "FormularioContatoViewController.h"
#import "Contato.h"

@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

- (id) init{
    self = [super init];
    if (self){
        self.navigationItem.title = @"Cadastro";
        
        UIBarButtonItem *cancela = [[UIBarButtonItem alloc]initWithTitle:@"Cancela" style:UIBarButtonItemStylePlain target:self action:@selector(escondeFormulario)];
        self.navigationItem.leftBarButtonItem = cancela;
        
        UIBarButtonItem *adiciona = [[UIBarButtonItem alloc]initWithTitle:@"Adiciona" style:UIBarButtonItemStylePlain target:self action:@selector(criaContato)];
        self.navigationItem.rightBarButtonItem = adiciona;
    }
    return self;
}

-(id)initWithContato:(Contato *)umContato{
    self = [super init];
    if (self) {
        self.contato = umContato;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (self.contato) {
        self.nome.text = self.contato.nome;
        self.telefone.text = self.contato.telefone;
        self.email.text = self.contato.email;
        self.endereco.text = self.contato.endereco;
        self.site.text = self.contato.site;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)proximoElemento:(UITextField *)textField{
    if (textField == self.nome) {
        [self.telefone becomeFirstResponder];
    } else if (textField == self.telefone){
        [self.email becomeFirstResponder];
    } else if (textField == self.email){
        [self.endereco becomeFirstResponder];
    } else if (textField == self.endereco) {
        [self.site becomeFirstResponder];
    } else if (textField == self.site){
        [self.site resignFirstResponder];
    }
}

-(void) escondeFormulario{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) criaContato{
    Contato *contato = [self pegaDadosDoFormulario];
    [self.contatos addObject:contato];
    
    NSLog(@"Contatos cadastrados %d", [self.contatos count]);
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (Contato *)pegaDadosDoFormulario {
    Contato *contato = [[Contato alloc]init];
    contato.nome = self.nome.text;
    contato.telefone = self.telefone.text;
    contato.email = self.email.text;
    contato.endereco = self.endereco.text;
    contato.site = self.site.text;
    
    return contato;
}
@end
