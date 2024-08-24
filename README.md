### Workshops 
### FIRST WORKSHOP :
DESCRIPTION
I opened git bash terminal and cloned the repository using `git clone https://github.com/khris-UI/UYO-ZK-WORKSHOP`
cd into the repository `cd UYO-ZK-WORKSHOP`
then cd into the first workshop folder `cd khris_ge_leo_stuff `
run the program `leo run main 3u32 5u32 --network testnet`
this returns 8u32 which is the sum of 3u32 and 5u32.
To deploy, use `leo deploy`
Note, before deployment go to the .env file and change the PRIVATE_KEY to your personal private key
TRANSACTION ID = at1r3jjjfp4vfk65tj006wqqy7kkfv8kzz4j0vulup2cm89z86meuyscmgjc8

### SECOND WORKSHOP: 
DESCRIPTION
Using the leo run main 3u32 2u32 command i was able to create my main.aleo file inside the simple token  hen i copied the code in the main.aleo and used it to deploy on my visual studio code terminal
transaction id=at15ry97mljj6n0qzqk8aaffqkf929gwq74ppv96uf98m7z3pm77qpsuxa60e

### THIRD WORKSHOP:
DESCRIPTION
Using 
// The 'aleo_voice7' program.
program voice_talk.aleo {

    //Record for Voice data
    record Voice {
        owner: address,
        receiver: address,
        msg: u128,
        hash_msg: u128,
    }

    //Record for combining both owner and receiver
    record CoBind {
        hash_owner: field,
        owner: address,
        receiver: address,
        bind_hash: field,
    }

    // struct data for storing user data
    struct Messaging {
        messenger: field,
        total_messages: u64,
    }

    //Mapping for  user data
    mapping voice_msg: field => Messaging;

    //send voice transition function with the async await js to update state. has 4 inputs
    async transition send_voice (owner: address, receiver: address, msg: u128,  co_bind: field) -> (Voice, Future){
        //hash a message
        let hash: u128 = BHP256:: hash_to_u128(msg);

        //checks if address calling match owner address
        assert(self.caller == owner);

        //checks address calling is not a receiver
        assert_neq(self.caller, receiver);
        
        //hash the owner
        let hash_owner: field = BHP256:: hash_to_field(owner);

        //hash the receiver
        let hash_receiver: field = BHP256:: hash_to_field(receiver);

        //add both [owner and receiver] hash
        let add_hash : field = hash_owner + hash_receiver ;

        // declaring them into a record -> Voice
        let send_from : Voice = Voice {
            owner: owner,
            receiver: receiver,
            msg: msg,
            hash_msg: hash
        };
        
        //return the record and update the state onchain with the function name - finalize_send_voice
        return (send_from, finalize_send_voice(owner, hash));

    }
    //state being updated
    async function finalize_send_voice (owner: address, hash: u128){
        //hash the owner
        let hash_owner: field = BHP256:: hash_to_field(owner);
        // getting the mapping detail, by default mapping is to -> hash_owner  and 0 total messages
        let total: Messaging = Mapping::get_or_use(voice_msg, hash_owner, Messaging{
            messenger: hash_owner,
            total_messages: 0u64,
        });
        
        //storing/setting the data into the mapping, now the data component will be uopdate to the hash_owner and n total messages
        voice_msg.set(hash_owner, Messaging {
            messenger: hash_owner,
            total_messages: total.total_messages + 1u64,
        });
    }

    transition combine_hash_owner_receiver(owner: address, receiver: address) -> (CoBind){
        assert_eq(owner, self.caller);
        let hash_owner: field = BHP256::hash_to_field(owner);
        let hash_receiver: field = BHP256::hash_to_field(receiver);
        let add_hash: field = hash_owner + hash_receiver;

        let update_hash: CoBind = CoBind {
            hash_owner: hash_owner,
            receiver: receiver,
            owner: owner,
            bind_hash: add_hash,
        };
        return (update_hash);
    }
}
I was able to build my main.aleo from the simple token file, then i copied the code, changed the private key to my own from my wallet then i entered the terminal in my vissual studio code then i ran the code format,..leo deploy
combine_harsh_owner_reciever <type_your_adress>
<type_friend_adress>deployed succesfully in my visual studio code terminal

 TRANSACTION ID=at15ry97mljj6n0qzqk8aaffqkf929gwq74ppv96uf98m7z3pm77qpsuxa60e

# description 


# preview 
![work](https://github.com/user-attachments/assets/cda6713c-52dd-4766-933a-def100438779)
